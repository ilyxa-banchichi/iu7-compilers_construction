from core.lexer import Lexer
from core.parser import Parser
from core.tree_printer import parse_tree_to_dot

def process_file(file_path):
    print(f'File {file_path}')
    with open("input/" + file_path, 'r', encoding='utf-8') as file:
        text = file.read()

    lexer = Lexer(text)
    parser = Parser(lexer)
    try:
        parser.program()
        if parser.errors:
            print("Обнаружены ошибки:")
            for i, err in enumerate(parser.errors, 1):
                print(f"{i}. {err}")
        else:
            print("Парсинг прошел успешно!")
    except Exception as e:
        print(f"Обнаружены ошибки: {e}")

if __name__ == "__main__":
    files = [
        '1.txt',
        '2.txt',
        '3.txt',
        '4.txt',
        '5.txt',
        'neg_1.txt',
        'neg_2.txt',
        'neg_3.txt',
    ]
    for file_name in files:
        process_file(file_name)