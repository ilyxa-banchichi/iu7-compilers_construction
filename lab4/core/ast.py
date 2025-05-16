from core.parse_tree import *

class visitor:
    def visit_program(self, node: NonTerminalNode):
        return self.visit_child(node)

    def visit_block(self, node: NonTerminalNode):
        return self.visit(node.child[1])

    def visit_operator_list(self, node: NonTerminalNode):
        result = []
        if len(node.child) > 0:
            operator = self.visit(node.child[0])
            operator_list = self.visit(node.child[1])

            result.append(operator)
            result.extend(operator_list)

        return result

    def visit_operator(self, node: NonTerminalNode):
        result = []
        var = self.visit(node.child[0])
        result.extend(var)
        if len(node.child) > 1:
            op = self.visit(node.child[1])
            expr = self.visit(node.child[2])

            result.extend(expr)
            result.extend(op)

        return result

    def visit_expression(self, node: NonTerminalNode):
        result = []
        l = self.visit(node.child[0])
        tail = self.visit(node.child[1])
        result.extend(l)
        result.extend(tail)

        return result

    def visit_expression_tail(self, node: NonTerminalNode):
        result = []
        if len(node.child) > 0:
            r = self.visit(node.child[1])
            op = self.visit(node.child[0])

            result.extend(r)
            result.extend(op)

        return result

    def visit_arithmetic_expression(self, node: NonTerminalNode):
        result = []
        l = self.visit(node.child[0])
        tail = self.visit(node.child[1])
        result.extend(l)
        result.extend(tail)

        return result

    def visit_arithmetic_expression_tail(self, node: NonTerminalNode):
        result = []
        if len(node.child) > 0:
            r = self.visit(node.child[1])
            op = self.visit(node.child[0])
            tail = self.visit(node.child[2])

            result.extend(r)
            result.extend(op)
            result.extend(tail)

        return result

    def visit_term(self, node: NonTerminalNode):
        result = []
        l = self.visit(node.child[0])
        tail = self.visit(node.child[1])
        result.extend(l)
        result.extend(tail)

        return result

    def visit_term_tail(self, node: NonTerminalNode):
        result = []
        if len(node.child) > 0:
            r = self.visit(node.child[1])
            op = self.visit(node.child[0])
            tail = self.visit(node.child[2])

            result.extend(r)
            result.extend(op)
            result.extend(tail)

        return result

    def visit_factor(self, node: NonTerminalNode):
        if len(node.child) == 3:
            return self.visit(node.child[1])
        else:
            return self.visit(node.child[0])

    def visit_relation_operator(self, node: NonTerminalNode):
        return self.visit_child(node)

    def visit_multiplicative_operator(self, node: NonTerminalNode):
        return self.visit_child(node)

    def visit_additive_operator(self, node: NonTerminalNode):
        return self.visit_child(node)

    def visit_child(self, node: NonTerminalNode):
        for c in node.child:
            return self.visit(c)

    def visit(self, node: Node) -> Node:
        if isinstance(node, TerminalNode):
            return [node.value]

        if isinstance(node, NonTerminalNode):
            if node.value == "program":
                return self.visit_program(node)

            if node.value == "block":
                return self.visit_block(node)

            if node.value == "operator_list":
                return self.visit_operator_list(node)

            if node.value == "operator":
                return self.visit_operator(node)

            if node.value == "expression":
                return self.visit_expression(node)

            if node.value == "expression_tail":
                return self.visit_expression_tail(node)

            if node.value == "arithmetic_expression":
                return self.visit_arithmetic_expression(node)

            if node.value == "arithmetic_expression_tail":
                return self.visit_arithmetic_expression_tail(node)

            if node.value == "term":
                return self.visit_term(node)

            if node.value == "term_tail":
                return self.visit_term_tail(node)

            if node.value == "factor":
                return self.visit_factor(node)

            if node.value == "relation_operator":
                return self.visit_relation_operator(node)

            if node.value == "multiplicative_operator":
                return self.visit_multiplicative_operator(node)

            if node.value == "additive_operator":
                return self.visit_additive_operator(node)

def visit_build_ast_from_parse_tree(node: Node) -> Node:
    v = visitor()
    return v.visit(node)