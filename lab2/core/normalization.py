from collections import defaultdict, deque
from typing import List
import copy

from core.grammar import Grammar
from core.grammar import new_literal_name

def to_greibach_normal_form(grammar: Grammar) -> Grammar:
    P = copy.deepcopy(grammar.productions)
    N = copy.deepcopy(grammar.non_terminals)
    N_ordered = compute_non_terminal_order(grammar)
    N_ordered = ["E'", "E", "T'", 'T', 'F']
    print(N_ordered)
    nt_index = {A: i for i, A in enumerate(N_ordered)}

    for i in range(len(N_ordered) - 2, -1, -1):
        Ai = N_ordered[i]
        Ai_right = [prod[1] for prod in P if prod[0] == Ai]
        replaced_rules = []
        for right in Ai_right:
            if right and right[0] in N and nt_index[right[0]] > i:
                Aj = right[0]
                alpha = right[1:]
                Aj_rules = [prod for prod in P if prod[0] == Aj]
                for _, beta in Aj_rules:
                    replaced_rules.append((Ai, beta + alpha))
            else:
                replaced_rules.append((Ai, right))

        P = [prod for prod in P if prod[0] != Ai] + replaced_rules

    for term in grammar.terminals:
        need_replace_term = False
        for _, right in P:
            if term in right[1:]:
                need_replace_term = True
                break

        if need_replace_term:
            new_non_term = new_literal_name(N, grammar.terminals, term)
            N.append(new_non_term)
            for _, right in P:
                for i in range(len(right)):
                    if term == right[i]:
                        right[i] = new_non_term

            P.append((new_non_term, [term]))

    return Grammar(N, grammar.terminals, P, grammar.start_symbol)


def compute_non_terminal_order(grammar: Grammar) -> List[str]:
    graph = defaultdict(set)
    in_degree = defaultdict(int)
    N = grammar.non_terminals

    # Инициализация степени захода
    for nt in N:
        in_degree[nt] = 0

    for left, right in grammar.productions:
        if right and right[0] in N:
            A = left
            B = right[0]
            if B not in graph[A]:
                graph[A].add(B)
                in_degree[B] += 1

    # Топологическая сортировка
    queue = deque([nt for nt in N if in_degree[nt] == 0])
    ordered = []

    while queue:
        nt = queue.popleft()
        ordered.append(nt)
        for neighbor in graph[nt]:
            in_degree[neighbor] -= 1
            if in_degree[neighbor] == 0:
                queue.append(neighbor)

    if len(ordered) != len(N):
        raise ValueError("Грамматика содержит левую рекурсию или цикл.")

    return ordered