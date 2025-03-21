from typing import List
from typing import Dict
from typing import Optional, Set
from dataclasses import dataclass, field

@dataclass
class MarkedNode:
    type: str
    nullable: bool = False
    firstpos: Set[int] = field(default_factory=set)
    lastpos: Set[int] = field(default_factory=set)

@dataclass
class InnerNode(MarkedNode):
    left: Optional['MarkedNode'] = None
    right: Optional['MarkedNode'] = None

@dataclass
class TermNode(MarkedNode):
    value: Optional['str'] = None
    position: Optional['int'] = None

def buildMarkedTree(rpn: List[str]) -> MarkedNode:
    stack = []
    positionCounter = 1
    for token in rpn:
        if token in ('*', '.', '|'):
            if token == '*':
                child = stack.pop()
                node = InnerNode('star', left=child)
            else:
                right = stack.pop()
                left = stack.pop()
                type = 'concat' if token == '.' else 'union'
                node = InnerNode(type, left=left, right=right)
        else:
            position = -1
            if token != 'ε':
                position = positionCounter
                positionCounter += 1

            node = TermNode('char', value=token, position=position)

        stack.append(node)

    if not stack:
        raise Exception("Отсутствуют токены для построения дерева")

    return stack[0]

def computeNodesFunctions(node: MarkedNode):
    if node is None: return

    if isinstance(node, InnerNode):
        computeNodesFunctions(node.left)
        computeNodesFunctions(node.right)

    if node.type == 'char':
        if node.value == 'ε':
            node.nullable = True
            node.firstpos = set()
            node.lastpos = set()
        else:
            node.nullable = False
            node.firstpos = { node.position }
            node.lastpos = { node.position }

    elif node.type == 'concat':
        node.nullable = node.left.nullable and node.right.nullable
        node.firstpos = set(node.left.firstpos)
        if node.left.nullable:
            node.firstpos.update(node.right.firstpos)

        node.lastpos = set(node.right.lastpos)
        if node.right.nullable:
            node.lastpos.update(node.left.lastpos)

    elif node.type == 'union':
        node.nullable = node.left.nullable or node.right.nullable
        node.firstpos = node.left.firstpos.union(node.right.firstpos)
        node.lastpos = node.left.lastpos.union(node.right.lastpos)

    elif node.type == 'star':
        node.nullable = True
        node.firstpos = set(node.left.firstpos)
        node.lastpos = set(node.left.lastpos)

def computeFollowpos(node: MarkedNode, followpos: Dict[int, List[int]]):
    if node.type == 'concat':
        for i in node.left.lastpos:
            followpos.setdefault(i, set()).update(node.right.firstpos)
        computeFollowpos(node.left, followpos)
        computeFollowpos(node.right, followpos)

    elif node.type == 'star':
        for i in node.left.lastpos:
            followpos.setdefault(i, set()).update(node.left.firstpos)
        computeFollowpos(node.left, followpos)

    elif node.type == 'union':
        computeFollowpos(node.left, followpos)
        computeFollowpos(node.right, followpos)