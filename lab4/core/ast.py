from core.parse_tree import *
import itertools

def flatten(lst):
    result = []
    for item in lst:
        if isinstance(item, list):
            result.extend(flatten(item))
        else:
            result.append(item)
    return result

class AstNode:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None

    def to_rpn(self):
        result = []
        if self.left != None:
            result.extend(self.left.to_rpn())
        if self.right != None:
            result.extend(self.right.to_rpn())
        result.append(str(self.value))
        return result

class visitor:
    def visit_program(self, node: NonTerminalNode):
        result = self.visit_child(node)
        return flatten(result)

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
        var = self.visit(node.child[0])
        if len(node.child) > 1:
            op = self.visit(node.child[1])
            expr = self.visit(node.child[2])

            result = AstNode(op.value)
            result.left = var
            result.right = expr
            return result

        return var

    def visit_expression(self, node: NonTerminalNode):
        l = self.visit(node.child[0])
        tail = self.visit(node.child[1])

        if tail != None:
            tail.left = l
            return tail
        else:
            return l

    def visit_expression_tail(self, node: NonTerminalNode):
        if len(node.child) > 0:
            r = self.visit(node.child[1])
            op = self.visit(node.child[0])
            tail = None
            if len(node.child) > 2:
                tail = self.visit(node.child[2])

            if tail != None:
                tail.left = r
                r = tail

            result = AstNode(op.value)
            result.right = r
            return result

        return None

    def visit_arithmetic_expression(self, node: NonTerminalNode):
        l = self.visit(node.child[0])
        tail = self.visit(node.child[1])

        if tail != None:
            tail.left = l
            return tail
        else:
            return l

    def visit_arithmetic_expression_tail(self, node: NonTerminalNode):
        if len(node.child) > 0:
            r = self.visit(node.child[1])
            op = self.visit(node.child[0])
            tail = self.visit(node.child[2])
            if tail != None:
                tail.left = r
                r = tail

            result = AstNode(op.value)
            result.right = r
            return result

        return None

    def visit_term(self, node: NonTerminalNode):
        l = self.visit(node.child[0])
        tail = self.visit(node.child[1])

        if tail != None:
            tail.left = l
            return tail
        else:
            return l

    def visit_term_tail(self, node: NonTerminalNode):
        if len(node.child) > 0:
            r = self.visit(node.child[1])
            op = self.visit(node.child[0])
            tail = self.visit(node.child[2])
            if tail != None:
                tail.left = r
                r = tail

            result = AstNode(op.value)
            result.right = r
            return result

        return None

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
            return AstNode(node.value)

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

def draw_ast_forest(trees: list[AstNode], filename="ast_forest"):
    dot = Digraph("AST", format="svg")
    id_gen = (f"n{i}" for i in itertools.count())

    def add_node(dot, node, parent_id=None):
        my_id = next(id_gen)
        dot.node(my_id, label=str(node.value))
        if parent_id:
            dot.edge(parent_id, my_id)

        if node.left != None:
            add_node(dot, node.left, parent_id=my_id)

        if node.right != None:
            add_node(dot, node.right, parent_id=my_id)

    for tree in trees:
        add_node(dot, tree)

    dot.render(filename, cleanup=True)