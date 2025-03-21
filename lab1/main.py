from core.buildDfa import regexToDfa
from core.minimization import brzozowski_minimization
from core.printDfa import saveDfaSvg

if __name__ == "__main__":
    regex = input("Введите регулярное выражение: ")
    dfa = regexToDfa(regex)
    minimized, intermediate = brzozowski_minimization(dfa)

    saveDfaSvg(dfa, "output/dfa")
    saveDfaSvg(intermediate, "output/intermediate")
    saveDfaSvg(minimized, "output/minimized")

    print("Вводите цепочки или пустую строку для завершения")
    while True:
        inputStr = input()
        if inputStr == "":
            break

        result = minimized.simulate(inputStr)
        print("Цепочка принята" if result else "Цепочка не принята")




