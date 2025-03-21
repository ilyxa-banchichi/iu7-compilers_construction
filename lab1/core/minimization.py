from core.dfa import DFA
from collections import deque
from typing import List, Tuple, Dict, Set

def reverse(dfa: DFA) -> Tuple[Set[int], Set[int], Dict[Tuple[int, int], Set[int]]]:
    reverseTransitions = {}
    for (src, symbol), dst in dfa.transitionDict.items():
        key = (dst, symbol)
        if key not in reverseTransitions:
            reverseTransitions[key] = set()
        reverseTransitions[key].add(src)

    reverseStart = set(dfa.accepts)
    reverseAccepts = {dfa.initial}
    return reverseStart, reverseAccepts, reverseTransitions

def determinize(reverseStart: Set[int], reverseAccepts: Set[int], reverseTransitions: Dict[Tuple[int, int], Set[int]], alphabet: List[str]) -> DFA:
    state_id = 0
    state_map = {}
    queue = deque()

    start_state = frozenset(reverseStart)
    state_map[start_state] = state_id
    queue.append(start_state)
    state_id += 1

    dfa_transitions = []
    dfa_accepts = []

    while queue:
        current = queue.popleft()
        current_name = state_map[current]

        if any(s in reverseAccepts for s in current):
            dfa_accepts.append(current_name)

        for symbolId in range(0, len(alphabet)):
            next_states = set()
            for state in current:
                key = (state, symbolId)
                if key in reverseTransitions:
                    next_states.update(reverseTransitions[key])

            if not next_states:
                continue

            next_frozen = frozenset(next_states)
            if next_frozen not in state_map:
                state_map[next_frozen] = state_id
                queue.append(next_frozen)
                state_id += 1

            dfa_transitions.append((current_name, symbolId, state_map[next_frozen]))

    dfa_states = [f"q{i}" for i in state_map.values()]
    initial_state = state_map[start_state]

    return DFA(
        alphabet=alphabet,
        states=dfa_states,
        initial=initial_state,
        accepts=dfa_accepts,
        transitions=dfa_transitions
    )

def brzozowskiMinimization(dfa: DFA) -> tuple[DFA, DFA]:
    reverseStart, reverseAccepts, reverseTransitions = reverse(dfa)
    intermediate_dfa = determinize(reverseStart, reverseAccepts, reverseTransitions, dfa.alphabet)

    reverseStart2, reverseAccepts2, reverseTrans2 = reverse(intermediate_dfa)
    minimized_dfa = determinize(reverseStart2, reverseAccepts2, reverseTrans2, dfa.alphabet)

    return minimized_dfa, intermediate_dfa