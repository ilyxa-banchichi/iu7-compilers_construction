from core.buildDfa import regexToDfa
from core.minimization import brzozowskiMinimization
from core.printDfa import saveDfaSvg

def testing(regex, tests, iter):
    dfa = regexToDfa(regex)

    print("Регулярное выражение: " + regex)

    print("________ДКА:")
    dfa.print()
    saveDfaSvg(dfa, f"output/tests/{iter}/dfa")

    minimized, intermediate = brzozowskiMinimization(dfa)

    print("________Промежуточный обратный КА:")
    intermediate.print()
    saveDfaSvg(intermediate, f"output/tests/{iter}/intermediate")

    print("________Минимальный КА:")
    minimized.print()
    saveDfaSvg(minimized, f"output/tests/{iter}/minimized")

    for test, expected in tests:
        print(f"Тест {test}. Ожидается {expected}")

        try:
            actualDfa = dfa.simulate(test)
            actualMinimized = minimized.simulate(test)
        except:
            actualDfa = False
            actualMinimized = False
            pass

        print(f"\tДКА {actualDfa}")
        print(f"\tМинимальный {actualMinimized}")
        print("OK" if actualDfa == expected and actualMinimized == expected else "FAIL")

testsPack = {
    "(a(b|c))*c": [
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
        ("", False),
        ("f", False)
    ],
    "(a|b)*|(a|b)|(ac)*|(a|b|c)*": [
        ("a", True),
        ("abcaa", True),
        ("f", False)
    ],
    "(a.b|c.d.(e.(f.g)*).h*)*.i*.j": [
        ("j", True),
        ("ij", True),
        ("abj", True),
        ("cdej", True),
        ("cdefgj", True),
        ("cdefgfgj", True),
        ("cdehj", True),
        ("cdefghhhj", True),
        ("ababcdefghiij", True),
        ("cdefgfghhiiiij", True),
        ("abcs", False),
        ("cdij", False),
        ("abce", False),
        ("cdhj", False)
    ]
}

iter = 1
for regex, tests in testsPack.items():
    testing(regex, tests, iter)
    iter += 1