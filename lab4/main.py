from core.lexer import Lexer
from core.parser import Parser
from core.parse_tree import save_tree_svg
from core.ast import visit_build_ast_from_parse_tree

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

    print(str(parser.tree))
    save_tree_svg(parser.tree.root, "output/" + file_path)
    ast = visit_build_ast_from_parse_tree(parser.tree.root.child[0])
    print(ast)
    # save_tree_svg(ast, "output/" + file_path + "_ast")

if __name__ == "__main__":
    files = [
        # '1.txt',
        # '2.txt',
        # '3.txt',
        # '4.txt',
        '5.txt',
        # 'neg_1.txt',
        # 'neg_2.txt',
        # 'neg_3.txt',
    ]
    for file_name in files:
        process_file(file_name)