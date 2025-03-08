import llvmlite.ir as ir
import numpy as np

class UnsupportedLiteralException(Exception):
    def __init__(self, name):
        self.name = name

class PascalTypes(object):
    intLabel = "integer"
    int = ir.IntType(16)

    longintLabel = "longint"
    longint = ir.IntType(32)

    byteLabel = "byte"
    byte = ir.IntType(8)

    booleanLabel = "boolean"
    boolean = ir.IntType(1)

    realLabel = "real"
    real = ir.FloatType()

    doubleLabel = "double"
    double = ir.DoubleType()

    defaultStringLabel = "string"
    defaultString = ir.ArrayType(ir.IntType(8), 255)

    strToType = {
        intLabel: int,
        longintLabel: longint,
        byteLabel: byte,
        booleanLabel: boolean,
        realLabel: real,
        doubleLabel: double,
        defaultStringLabel: defaultString,
    }

    intRanges = {
        byteLabel: (0, 255),
        intLabel: (0, 32768),
        longintLabel: (0, 2147483648)
    }

    @classmethod
    def getStringType(cls, length):
        return ir.ArrayType(ir.IntType(8), length)

    @classmethod
    def getIntLiteralType(cls, number):
        for key in PascalTypes.intRanges.keys():
            min_val, max_val = PascalTypes.intRanges[key]
            if min_val <= number <= max_val:
                return PascalTypes.strToType[key]

        raise UnsupportedLiteralException()

    @classmethod
    def getFloatLiteralType(cls, number):
        return PascalTypes.real