import itertools
from graphviz import Digraph

def flatten(lst):
    result = []
    for item in lst:
        if isinstance(item, list):
            result.extend(flatten(item))
        else:
            result.append(item)
    return result

class AstNode:
    def __init__(self, parent, value):
        self.value = value
        self.parent = parent
        self.child = []

def draw_ast(trees: list[AstNode], filename="ast", directory=''):
    dot = Digraph("AST", format="svg")
    id_gen = (f"n{i}" for i in itertools.count())

    def add_node(dot, node, parent_id=None):
        my_id = next(id_gen)
        dot.node(my_id, label=str(node.value))
        if parent_id:
            dot.edge(parent_id, my_id)

        if len(node.child) > 0:
            for c in node.child:
                add_node(dot, c, parent_id=my_id)


    for tree in trees:
        add_node(dot, tree)

    dot.render(filename, directory=directory, cleanup=True)