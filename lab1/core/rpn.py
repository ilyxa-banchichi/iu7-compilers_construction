from collections import deque
from typing import List
from core.symbols import *

def getPrecedence(op: str) -> int:
    return {'*': 3, '.': 2, '|': 1}.get(op, 0)

def insertConcatDots(regex: str) -> str:
    result = ""
    prev = ""
    for i, curr in enumerate(regex):
        if prev:
            if ((prev.isalnum() or prev in "*+?)") and (curr.isalnum() or curr == "(")):
                result += "."
        result += curr
        prev = curr
    return result

def regexToRpn(regex: str) -> List[str]:
    regex = insertConcatDots(regex)
    output = []
    operators = deque()

    for char in regex:
        if char.isalnum() or char == END_CHAIN_CHAR:
            output.append(char)
        elif char in {'|', '.', '*'}:
            while operators and getPrecedence(operators[-1]) >= getPrecedence(char):
                output.append(operators.pop())
            operators.append(char)
        elif char == '(':
            operators.append(char)
        elif char == ')':
            while operators and operators[-1] != '(':
                output.append(operators.pop())
            operators.pop()

    while operators:
        output.append(operators.pop())

    return output
