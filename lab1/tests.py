from core.buildDfa import regexToDfa
from core.minimization import brzozowski_minimization
from core.printDfa import saveDfaSvg

regex = "(a(b|c))*c"
dfa = regexToDfa(regex)

print("________ДКА:")
dfa.print()
saveDfaSvg(dfa, "output/tests/dfa")

minimized, intermediate = brzozowski_minimization(dfa)

print("________Промежуточный обратный КА:")
intermediate.print()
saveDfaSvg(intermediate, "output/tests/intermediate")

print("________Минимальный КА:")
minimized.print()
saveDfaSvg(minimized, "output/tests/minimized")

tests = [
    ("c", True),
    ("abc", True),
    ("acc", True),
    ("abacabacabc", True),
    ("abacabacacc", True),
    ("abacbc", False),
    ("aabbc", False),
    ("ab", False),
    ("acb", False),
    ("aac", False),
    ("", False)
]

for test, expected in tests:
    print(f"Тест {test}. Ожидается {expected}")

    actualDfa = dfa.simulate(test)
    actualMinimized = minimized.simulate(test)

    print(f"\tДКА {actualDfa}")
    print(f"\tМинимальный {actualMinimized}")
    print("OK" if actualDfa == expected and actualMinimized == expected else "FAIL")