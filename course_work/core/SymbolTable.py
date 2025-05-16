class RedefinitionException(Exception):
    def __init__(self, name):
        self.name = name

class IncompatibleTypesException(Exception):
    def __init__(self, name):
        self.name = name

class SymbolTable:
    def __init__(self):
        self.__tables = [{},]
        self.__level = 0

    def __getitem__(self, item):
        for level in range(self.__level, -1, -1):
            if item in self.__tables[level]:
                return self.__tables[level][item]
        raise Exception(f"Не найден символ {item}")

    def __setitem__(self, key, value):
        if key in self.__tables[self.__level]:
            raise RedefinitionException(key)
        self.__tables[self.__level][key] = value

    def __contains__(self, item):
        for level in range(self.__level, -1, -1):
            if item in self.__tables[level]:
                return True
        return False

    def enter_scope(self):
        self.__level += 1
        self.__tables.append({})

    def exit_scope(self):
        if self.__level == 0:
            return
        self.__tables.pop(-1)
        self.__level -= 1

    def print(self):
        print("Таблица символов")
        for t in self.__tables:
            print(t)