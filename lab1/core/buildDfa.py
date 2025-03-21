from collections import deque
from typing import List, Tuple
from core.rpn import regexToRpn
from core.markedTree import *
from core.markedTree import buildMarkedTree
from core.symbols import *
from core.dfa import DFA

def collectSymbols(node: MarkedNode):
    symbolPositions = {}
    pos2Symbol = {}
    endPosition = None

    def collectSymbolsNext(node: MarkedNode):
        nonlocal endPosition
        if node.type == 'char':
            if node.value == END_CHAIN_CHAR:
                endPosition = node.position
            elif node.value != EPSILON_CHAR:
                symbolPositions.setdefault(node.value, set()).add(node.position)
                pos2Symbol[node.position] = node.value
        if isinstance(node, InnerNode):
            if node.left:
                collectSymbolsNext(node.left)
            if node.right:
                collectSymbolsNext(node.right)

    collectSymbolsNext(node)

    return symbolPositions, pos2Symbol, endPosition

def AddDeathState(dfa: DFA):
    dfa.states.append(EMPTY_SET_CHAR)
    deathStateIndex = len(dfa.states) - 1
    for stateId in range(0, deathStateIndex):
        for symbolId in range(0, len(dfa.alphabet)):
            transitionKey = (stateId, symbolId)
            if transitionKey not in dfa.transitionDict:
                dfa.transitions.append((stateId, symbolId, deathStateIndex))
                dfa.transitionDict[transitionKey] = deathStateIndex

    for symbolId in range(0, len(dfa.alphabet)):
        dfa.transitions.append((deathStateIndex, symbolId, deathStateIndex))
        dfa.transitionDict[(deathStateIndex, symbolId)] = deathStateIndex

def buildDfa(root: MarkedNode) -> DFA:
    followpos = {}
    computeFollowpos(root, followpos)
    symbolPositions, pos2Symbol, endPosition = collectSymbols(root)

    alphabet = list(set(symbolPositions.keys()))
    startState = frozenset(root.firstpos)
    states = {startState: False}
    transitions = {}
    queue = deque([startState])
    accept_states = set()

    while queue:
        current = queue.popleft()
        if states[current]:
            continue
        states[current] = True

        if endPosition in current:
            accept_states.add(current)

        for symbolId in range(0, len(alphabet)):
            positions = {pos for pos in current if pos2Symbol.get(pos) == alphabet[symbolId]}
            if not positions:
                continue
            nextState = set()
            for pos in positions:
                nextState.update(followpos.get(pos, set()))
            nextState = frozenset(nextState)
            if not nextState:
                continue
            transitions[(current, symbolId)] = nextState
            if nextState not in states:
                states[nextState] = False
                queue.append(nextState)

    stateIds = {state: i for i, state in enumerate(states)}
    dfa = DFA(alphabet=list(alphabet),
            states=[f"q{stateIds[s]}" for s in states],
            initial=stateIds[startState],
            accepts=[stateIds[s] for s in accept_states],
            transitions=[
                (stateIds[src], sym, stateIds[dst]) for (src, sym), dst in transitions.items()
            ]
    )

    AddDeathState(dfa)
    return dfa

def regexToDfa(regex: str) -> DFA:
    regex = regex + END_CHAIN_CHAR
    rpn = regexToRpn(regex)
    root = buildMarkedTree(rpn)
    computeNodesFunctions(root)

    return buildDfa(root)