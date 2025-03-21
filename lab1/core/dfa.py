from dataclasses import dataclass
from typing import List, Tuple, Dict
from core.symbols import *

@dataclass
class DFA:
    alphabet: List[str]
    states: List[str]
    initial: int
    accepts: List[int]
    transitions: List[Tuple[int, int, int]]
    transitionDict: Dict[Tuple[int, int], int]

    def __init__(self, alphabet: List[str], states: List[str], initial: int, accepts: List[int], transitions: List[Tuple[int, int, int]]):
        self.alphabet = alphabet
        self.states = states
        self.initial = initial
        self.accepts = accepts
        self.transitions = transitions
        self.transitionDict = self._buildTransitionDict()

    def _buildTransitionDict(self) -> Dict[Tuple[int, int], int]:
        return {(src, symbol): dst for src, symbol, dst in self.transitions}

    def simulate(self, inputStr: str) -> bool:
        current_state = self.initial
        for symbol in inputStr:
            if symbol not in self.alphabet:
                raise ValueError(f"Символ '{symbol}' не входит в алфавит")

            symbolId = self.alphabet.index(symbol)
            transition = self.transitionDict.get((current_state, symbolId))
            if transition == None:
                return False

            current_state = transition

        return current_state in self.accepts

    def print(self):
        print("Alphabet:", self.alphabet)
        print("States:", self.states)
        print("Initial:", self.initial)
        print("Accept states:", self.accepts)
        print("Transitions:", self.transitions)
        print("Transition Dict:", self.transitionDict)
        for t in self.transitions:
            print(f"{self.states[t[0]]} -{self.alphabet[t[1]]}-> {self.states[t[2]]}")