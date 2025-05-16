from dataclasses import dataclass, field
from typing import List, Optional
from graphviz import Digraph

@dataclass
class Node:
    value: str
    parent: Optional['NonTerminalNode'] = None

    def __str__(self):
        return self.value

@dataclass
class TerminalNode(Node):
    def __str__(self):
        return f"Terminal({self.value})"

@dataclass
class NonTerminalNode(Node):
    child: List[Node] = field(default_factory=list)

    def add_child(self, child: Node):
        self.child.append(child)
        child.parent = self

    def __str__(self, level=0):
        indent = '  ' * level
        result = f"{indent}Node({self.value})\n"
        for ch in self.child:
            if isinstance(ch, NonTerminalNode):
                result += ch.__str__(level + 1)
            else:
                result += f"{'  ' * (level + 1)}{ch}\n"
        return result

@dataclass
class ParseTree:
    root: NonTerminalNode = field(default_factory=lambda: NonTerminalNode(value="$root"))
    _node: NonTerminalNode = field(init=False)

    def __post_init__(self):
        self._node = self.root

    def new_node(self, name: str):
        node = NonTerminalNode(value=name)
        self._node.add_child(node)
        self._node = node

    def new_terminal(self, token: str):
        self._node.add_child(TerminalNode(value=token))

    def up(self):
        if self._node.parent:
            self._node = self._node.parent

    def __str__(self):
        return str(self.root)

def tree_to_graphviz(root: Node) -> Digraph:
    dot = Digraph(name="AST", format="svg")
    node_id_gen = (f"n{i}" for i in range(10000))

    def visit(node: TerminalNode, parent_id=None):
        my_id = next(node_id_gen)
        label = node.value
        shape = "box"

        if isinstance(node, NonTerminalNode):
            shape = "ellipse"

        dot.node(my_id, label=label, shape=shape)

        if parent_id is not None:
            dot.edge(parent_id, my_id)

        if isinstance(node, NonTerminalNode):
            for child in node.child:
                visit(child, my_id)

    visit(root)
    return dot

def save_tree_svg(root: Node, filename: str):
    dot = tree_to_graphviz(root)
    dot.render(filename, format="svg", cleanup=True)