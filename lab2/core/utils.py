from typing import List
from core.grammar import Grammar

def new_literal_name(non_terminals: List[str], terminals: List[str], x: str) -> str:
    while x in non_terminals or x in terminals:
        x += "'"
    return x