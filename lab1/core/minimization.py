from core.dfa import DFA
from collections import deque
from typing import List, Tuple, Dict, Set, FrozenSet
from core.printDfa import saveDfaSvg

def reverse(dfa: DFA) -> Tuple[Set[str], Set[str], Dict[Tuple[str, str], Set[str]], Set[str]]:
    reverseTransitions: Dict[Tuple[str, str], Set[str]] = {}
    for (src, symbol), dst in dfa.transitionDict.items():
        key = (dst, symbol)
        if key not in reverseTransitions:
            reverseTransitions[key] = set()
        reverseTransitions[key].add(src)

    nfa_start = set(dfa.accepts)
    nfa_accepts = {dfa.initial}
    return nfa_start, nfa_accepts, reverseTransitions, set(dfa.states)

def determinize(nfa_start: Set[str], nfa_accepts: Set[str], nfa_transitions: Dict[Tuple[str, str], Set[str]], states: Set[str], alphabet: List[str]) -> DFA:
    state_id = 0
    state_map: Dict[FrozenSet[str], str] = {}
    queue = deque()

    start_state = frozenset(nfa_start)
    state_map[start_state] = state_id
    queue.append(start_state)
    state_id += 1

    dfa_transitions = []
    dfa_accepts = []

    while queue:
        current = queue.popleft()
        current_name = state_map[current]

        if any(s in nfa_accepts for s in current):
            dfa_accepts.append(current_name)

        for symbolId in range(0, len(alphabet)):
            next_states = set()
            for state in current:
                key = (state, symbolId)
                if key in nfa_transitions:
                    next_states.update(nfa_transitions[key])

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

def brzozowski_minimization(dfa: DFA) -> tuple[DFA, DFA]:
    nfa_start, nfa_accepts, nfa_trans, nfa_states = reverse(dfa)
    intermediate_dfa = determinize(nfa_start, nfa_accepts, nfa_trans, nfa_states, dfa.alphabet)

    nfa_start2, nfa_accepts2, nfa_trans2, nfa_states2 = reverse(intermediate_dfa)
    minimized_dfa = determinize(nfa_start2, nfa_accepts2, nfa_trans2, nfa_states2, dfa.alphabet)

    return minimized_dfa, intermediate_dfa