from collections import defaultdict
from itertools import groupby
from typing import List
import copy

from core.grammar import Grammar
from core.symbols import *

def left_factoring(grammar: Grammar) -> Grammar:
    productions = copy.deepcopy(grammar.productions)
    non_terminals = grammar.non_terminals[:]
    terminals = grammar.terminals[:]

    prod_map = defaultdict(list)
    for lhs, rhs in productions:
        prod_map[lhs].append(rhs)

    changed = True

    while changed:
        changed = False
        new_prod_map = defaultdict(list)

        for A in list(prod_map.keys()):
            grouped = group_prefixes(prod_map[A])
            if len(grouped) != len(prod_map[A]):
                changed = True

            for prefix, group in grouped.items():
                if len(group) == 1:
                    new_prod_map[A].append(group[0])
                else:
                    A_dash = f"{A}'"

                    while A_dash in non_terminals or A_dash in terminals:
                        A_dash += "'"
                    non_terminals.append(A_dash)

                    new_prod_map[A].append(list(prefix) + [A_dash])

                    for rhs in group:
                        suffix = rhs[len(prefix):] or [EPSILON_CHAR]
                        new_prod_map[A_dash].append(suffix)

        prod_map = new_prod_map

    final_productions = []
    for lhs, rhss in prod_map.items():
        for rhs in rhss:
            final_productions.append((lhs, rhs))

    return Grammar(
        non_terminals=non_terminals,
        terminals=terminals,
        productions=final_productions,
        start_symbol=grammar.start_symbol
    )


def group_prefixes(rhs_list: List[List[str]]) -> dict:
    prefix_groups = defaultdict(list)

    rhs_list.sort()
    for _, group in groupby(rhs_list, key=lambda x: x[0] if x else ''):
        group = list(group)
        if len(group) == 1:
            prefix_groups[tuple(group[0])].append(group[0])
        else:
            prefix = longest_common_prefix(group)
            prefix_groups[tuple(prefix)].extend(group)

    return dict(prefix_groups)


def longest_common_prefix(sequences: List[List[str]]) -> List[str]:
    if not sequences:
        return []

    min_len = min(len(seq) for seq in sequences)
    prefix = []

    for i in range(min_len):
        current = sequences[0][i]
        if all(seq[i] == current for seq in sequences):
            prefix.append(current)
        else:
            break

    return prefix