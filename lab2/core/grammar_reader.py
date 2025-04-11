from core.grammar import Grammar
from core.symbols import *

def read_grammar(file_path: str) -> Grammar:
    with open(file_path, 'r', encoding='utf-8') as file:
        lines = [line.strip() for line in file if line.strip()]

    i = 0
    num_non_terminals = int(lines[i])
    i += 1
    non_terminals = lines[i].split()
    i += 1
    if len(non_terminals) != num_non_terminals:
        raise ValueError("Количество нетерминалов не совпадает с заявленным")

    num_terminals = int(lines[i])
    i += 1
    terminals = lines[i].split()
    i += 1
    if len(terminals) != num_terminals:
        raise ValueError("Количество терминалов не совпадает с заявленным")

    num_productions = int(lines[i])
    i += 1
    productions = []
    for _ in range(num_productions):
        left, right = lines[i].split(PRODUCTION_OPERATOR)
        left = left.strip()
        right_symbols = right.strip().split()
        productions.append((left, right_symbols))
        i += 1

    start_symbol = lines[i].strip()
    if start_symbol not in non_terminals:
        raise ValueError("Начальный символ не является нетерминалом")

    return Grammar(
        non_terminals=non_terminals,
        terminals=terminals,
        productions=productions,
        start_symbol=start_symbol
    )