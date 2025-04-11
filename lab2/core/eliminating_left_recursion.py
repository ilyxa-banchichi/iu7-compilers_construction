from core.grammar import Grammar
from core.symbols import *

def eliminate_left_recursion(grammar: Grammar) -> Grammar:
    new_non_terminals = grammar.non_terminals[:]
    prod_map = {nt: [] for nt in new_non_terminals}

    for lhs, rhs in grammar.productions:
        prod_map[lhs].append(rhs)

    for i in range(len(new_non_terminals)):
        Ai = new_non_terminals[i]
        for j in range(i):
            Aj = new_non_terminals[j]
            new_rhs_list = []

            for rhs in prod_map[Ai]:
                if rhs and rhs[0] == Aj:
                    for delta in prod_map[Aj]:
                        new_rhs_list.append(delta + rhs[1:])
                else:
                    new_rhs_list.append(rhs)
            prod_map[Ai] = new_rhs_list

        prod_map, new_non_terminals = _eliminate_immediate_for(prod_map, Ai, new_non_terminals)

    final_productions = []
    for lhs in new_non_terminals:
        for rhs in prod_map.get(lhs, []):
            final_productions.append((lhs, rhs))

    return Grammar(
        non_terminals=new_non_terminals,
        terminals=grammar.terminals,
        productions=final_productions,
        start_symbol=grammar.start_symbol
    )


def _eliminate_immediate_for(prod_map, non_terminal, all_non_terminals):
    recursive = []
    non_recursive = []

    for rhs in prod_map[non_terminal]:
        if rhs and rhs[0] == non_terminal:
            recursive.append(rhs[1:])
        else:
            non_recursive.append(rhs)

    if not recursive:
        return prod_map, all_non_terminals

    new_nt = f"{non_terminal}'"
    all_non_terminals.append(new_nt)

    prod_map[non_terminal] = [beta + [new_nt] for beta in non_recursive]
    prod_map[new_nt] = [alpha + [new_nt] for alpha in recursive]
    prod_map[new_nt].append([EPSILON_CHAR])

    return prod_map, all_non_terminals