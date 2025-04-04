from llvmlite import ir

type_priority = {
    ir.DoubleType(): 5,
    ir.FloatType(): 4,
    ir.IntType(32): 3,
    ir.IntType(16): 2,
    ir.IntType(8): 1,
}

priority_to_type = {v: k for k, v in type_priority.items()}

def castStoredValue(builder, ptr, value):
    target_type = ptr.type.pointee
    value_type = value.type

    if target_type == value_type:
        return value

    target_prio = type_priority.get(target_type)
    value_prio = type_priority.get(value_type)

    if target_prio is None or value_prio is None:
        raise TypeError(f"Unsupported type(s): {value_type} -> {target_type}")

    if value_prio > target_prio:
        raise TypeError(f"Unsafe cast from higher-priority {value_type} to {target_type}")

    # int -> float/double
    if isinstance(value_type, ir.IntType) and isinstance(target_type, ir.FloatType):
        return builder.sitofp(value, target_type)

    # float -> double
    if isinstance(value_type, ir.FloatType) and isinstance(target_type, ir.DoubleType):
        return builder.fpext(value, target_type)

    # int -> int
    if isinstance(value_type, ir.IntType) and isinstance(target_type, ir.IntType):
        return builder.sext(value, target_type)

    raise TypeError(f"Unsupported cast: {value_type} -> {target_type}")

def castValues(builder, left_val, right_val):
    left_ty = left_val.type
    right_ty = right_val.type

    left_priority = type_priority.get(left_ty)
    right_priority = type_priority.get(right_ty)

    if left_priority is None or right_priority is None:
        raise TypeError(f"Unsupported types: {left_ty}, {right_ty}")

    target_priority = max(left_priority, right_priority)
    target_type = priority_to_type[target_priority]

    def cast(value, from_ty):
        if from_ty == target_type:
            return value

        # Приведение int -> float
        if isinstance(from_ty, ir.IntType) and isinstance(target_type, ir.FloatType):
            return builder.sitofp(value, target_type)

        # Приведение int -> double
        if isinstance(from_ty, ir.IntType) and isinstance(target_type, ir.DoubleType):
            return builder.sitofp(value, target_type)

        # float -> double
        if isinstance(from_ty, ir.FloatType) and isinstance(target_type, ir.DoubleType):
            return builder.fpext(value, target_type)

        # int -> int (например, i8 -> i32)
        if isinstance(from_ty, ir.IntType) and isinstance(target_type, ir.IntType):
            return builder.sext(value, target_type)

        # float -> float (например, float -> float — уже не нужно)
        # double -> float (недопустимо по приоритету вниз)
        raise TypeError(f"Unsupported cast: {from_ty} -> {target_type}")

    new_left = cast(left_val, left_ty)
    new_right = cast(right_val, right_ty)

    return new_left, new_right