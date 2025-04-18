import sys
import os

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '../../lab2')))

from core.grammar import Grammar
from core.grammar_reader import read_grammar
from core.eliminating_left_recursion import eliminate_left_recursion
from core.left_factoring import left_factoring
from core.normalization import to_greibach_normal_form

def estimate_recursion(file_name: str):
    grammar = read_grammar(file_name)
    grammar.print()
    grammar = eliminate_left_recursion(grammar)
    grammar = left_factoring(grammar)
    grammar.print()

    with open("output_" + file_name, 'w', encoding='utf-8') as file:
        file.write(str(grammar))

if __name__ == "__main__":
    files = [
        'expressions_grammar.txt'
    ]
    for file_name in files:
        estimate_recursion(file_name)

