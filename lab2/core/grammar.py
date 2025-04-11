from dataclasses import dataclass
from typing import List, Tuple

@dataclass
class Grammar:
    non_terminals: List[str]
    terminals: List[str]
    productions: List[Tuple[str, List[str]]]
    start_symbol: str

    def __str__(self) -> str:
        result = []
        result.append(str(len(self.non_terminals)))
        result.append(" ".join(self.non_terminals))
        result.append(str(len(self.terminals)))
        result.append(" ".join(self.terminals))
        result.append(str(len(self.productions)))
        for lhs, rhs in self.productions:
            result.append(f"{lhs} -> {' '.join(rhs)}")
        result.append(self.start_symbol)
        return '\n'.join(result)

    def print(self):
        print("Нетерминалы:", self.non_terminals)
        print("Терминалы:", self.terminals)
        print("Правила:")
        for lhs, rhs in self.productions:
            print(f"\t{lhs} -> {' '.join(rhs)}")
        print("Начальный символ:", self.start_symbol)

def new_literal_name(non_terminals: List[str], terminals: List[str], x: str) -> str:
    while x in non_terminals or x in terminals:
        x += "'"
    return x