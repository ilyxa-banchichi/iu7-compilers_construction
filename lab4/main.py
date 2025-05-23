from core.lexer import Lexer
from core.parser import Parser
from core.parse_tree import save_tree_svg
from core.ast import visit_build_ast_from_parse_tree
from core.ast import draw_ast_forest

def process_file(file_path):
    print(f'________File {file_path}________')
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
                return
        else:
            print("Парсинг прошел успешно!")
    except Exception as e:
        print(f"Обнаружены ошибки: {e}")

    # print("# Дерево разбора")
    # print(str(parser.tree))
    save_tree_svg(parser.tree.root, "output/" + file_path)
    ast = visit_build_ast_from_parse_tree(parser.tree.root.child[0])

    i = 0
    for a in ast:
        i += 1
        print(f"#ОПН для выражения {i}")
        print(' '.join(a.to_rpn()))
    draw_ast_forest(ast,"output/" + file_path + "_ast" )

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