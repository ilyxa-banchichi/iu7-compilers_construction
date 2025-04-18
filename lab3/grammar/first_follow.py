from collections import defaultdict
import sys
import os

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../../lab2')))

from core.grammar import Grammar
from core.grammar_reader import read_grammar

FIRST = defaultdict(set)

def compute_first(grammar: Grammar, symbol: str):
    if symbol in FIRST:
        return FIRST[symbol]

    if symbol not in grammar.non_terminals:
        return {symbol}

    result = set()
    for production in grammar.productions:
        if production[0] != symbol:
            continue
        for sym in production[1]:
            sym_first = compute_first(grammar, sym)
            result |= sym_first - {"ε"}
            if "ε" not in sym_first:
                break
        else:
            result.add("ε")

    FIRST[symbol] = result
    return result

FOLLOW = defaultdict(set)
def compute_follow(grammar: Grammar):
    for nt in grammar.non_terminals:
        FOLLOW[nt] = set()
    FOLLOW[grammar.start_symbol].add('$')

    changed = True
    while changed:
        changed = False
        for lhs, rhs in grammar.productions:
            for i in range(len(rhs)):
                B = rhs[i]
                if B not in grammar.non_terminals:
                    continue

                beta = rhs[i + 1:]

                if beta:
                    first_beta = set()
                    for sym in beta:
                        first_sym = compute_first(grammar, sym)
                        first_beta |= first_sym - {"ε"}
                        if "ε" not in first_sym:
                            break
                    else:
                        first_beta.add("ε")

                    before = len(FOLLOW[B])
                    FOLLOW[B] |= (first_beta - {"ε"})
                    if "ε" in first_beta:
                        FOLLOW[B] |= FOLLOW[lhs]
                    if len(FOLLOW[B]) > before:
                        changed = True

                else:
                    before = len(FOLLOW[B])
                    FOLLOW[B] |= FOLLOW[lhs]
                    if len(FOLLOW[B]) > before:
                        changed = True

    return FOLLOW

if __name__ == "__main__":
    grammar = read_grammar("output_expressions_grammar.txt")
    for nonterm in grammar.non_terminals:
        compute_first(grammar, nonterm)

    compute_follow(grammar)

    print('FIRST')
    for nonterm in FIRST.keys():
        print(nonterm + ": " + ", ".join(FIRST[nonterm]))

    print('FOLLOW')
    for nonterm in FOLLOW.keys():
        print(nonterm + ": " + ", ".join(FOLLOW[nonterm]))
