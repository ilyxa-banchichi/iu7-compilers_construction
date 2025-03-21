from dataclasses import dataclass
from collections import defaultdict
import graphviz
from core.dfa import DFA

def DfaToGraphviz(dfa: DFA) -> str:
    lines = ["digraph DFA {"]
    lines.append('  rankdir=LR;')
    lines.append('  node [shape=circle];')

    lines.append('  start [shape=point, style=invis];')
    lines.append(f'  start -> {dfa.states[dfa.initial]};')

    for state in dfa.accepts:
        lines.append(f'{dfa.states[state]} [shape=doublecircle];')

    transition_map = defaultdict(list)
    for src, symbol, dst in dfa.transitions:
        transition_map[(dfa.states[src], dfa.states[dst])].append(dfa.alphabet[symbol])

    for (src, dst), symbols in transition_map.items():
        label = ", ".join(sorted(symbols))
        lines.append(f'{src} -> {dst} [label="{label}"];')

    lines.append("}")
    return "\n".join(lines)

def saveDfaSvg(dfa: DFA, filename: str = "dfa") -> None:
    dot_code = DfaToGraphviz(dfa)
    graph = graphviz.Source(dot_code)
    graph.render(filename, format='svg', cleanup=True)