from core.grammar import Grammar
from core.grammar_reader import read_grammar
from core.eliminating_left_recursion import eliminate_left_recursion
from core.left_factoring import left_factoring

def estimate_recursion(file_name: str):
    grammar = read_grammar("input/" + file_name)
    grammar.print()
    grammar = eliminate_left_recursion(grammar)
    grammar = left_factoring(grammar)
    grammar.print()

    with open("output/" + file_name, 'w', encoding='utf-8') as file:
        file.write(str(grammar))

def normalize(file_name: str):
    grammar = read_grammar("input/" + file_name)
    grammar.print()
    grammar.print()

    with open("output/" + file_name, 'w', encoding='utf-8') as file:
        file.write(str(grammar))


if __name__ == "__main__":
    files = [
        'example4_7.txt',
        'example4_9.txt',
        'example4_11.txt',
    ]
    for file_name in files:
        estimate_recursion(file_name)

    files = [
        'example2_29.txt',
        'example2_4_19.txt',
    ]
    for file_name in files:
        normalize(file_name)

