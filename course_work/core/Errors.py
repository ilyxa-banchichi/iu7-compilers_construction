from antlr4.error.ErrorListener import ErrorListener

class SemanticErrorListener(ErrorListener):
    def __init__(self):
        super().__init__()
        self.errors = []

    def semanticError(self, line, column, msg):
        exception = f"Semantic Error: {str(line)} : {str(column)} {msg}"
        self.errors.append(exception)

    def print_errors(self):
        for err in self.errors:
            print(err)
        print(f"{len(self.errors)} errors generated")

class SyntaxErrorListener(ErrorListener):
    def __init__(self):
        super().__init__()
        self.errors = []

    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        exception = f"Syntax Error: {str(line)} : {str(column)} {msg}"
        self.errors.append(exception)

    def print_errors(self):
        for err in self.errors:
            print(err)
        print(f"{len(self.errors)} errors generated")