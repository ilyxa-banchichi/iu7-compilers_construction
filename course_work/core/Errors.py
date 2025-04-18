from antlr4.error.ErrorListener import ErrorListener

class SyntaxErrorListener(ErrorListener):
    def __init__(self):
        super().__init__()
        self.errors = []

    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        exception = f"Syntax Error: {str(line)} : {str(column)} {msg}"
        self.errors.append(exception)

    def register_semantic_error(self, error):
        self.errors.append(str(error))

    def print_errors(self):
        for err in self.errors:
            print(err)
        print(f"{len(self.errors)} errors generated")