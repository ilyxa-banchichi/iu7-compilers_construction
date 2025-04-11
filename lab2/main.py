from core.grammar import Grammar
from core.grammar_reader import read_grammar
from core.eliminating_left_recursion import eliminate_left_recursion

def process_file(file_name: str):
    grammar = read_grammar("input/" + file_name)
    grammar = eliminate_left_recursion(grammar)
    grammar.print()

    with open("output/" + file_name, 'w', encoding='utf-8') as file:
        file.write(str(grammar))

if __name__ == "__main__":
    files = [
        'example4_7.txt',
        'example4_9.txt',
    ]
    for file_name in files:
        process_file(file_name)

