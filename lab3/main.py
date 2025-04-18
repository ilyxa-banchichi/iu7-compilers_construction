from core.lexer import Lexer
from core.parser import Parser
from core.tree_printer import parse_tree_to_dot

def process_file(file_path):
    with open("input/" + file_path, 'r', encoding='utf-8') as file:
        text = file.read()

    lexer = Lexer(text)
    parser = Parser(lexer)
    parser.program()
    print("Parsing completed successfully!")
    print("".join(parser.tree))

    output_file = "output/" + file_path[:-4]
    parse_tree_to_dot("".join(parser.tree), output_file=output_file)

if __name__ == "__main__":
    files = [
        '1.txt',
        '2.txt',
        '3.txt',
        '4.txt',
        '5.txt',
    ]
    for file_name in files:
        process_file(file_name)