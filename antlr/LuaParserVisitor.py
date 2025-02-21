# Generated from LuaParser.g4 by ANTLR 4.13.2
from antlr4 import *
if "." in __name__:
    from .LuaParser import LuaParser
else:
    from LuaParser import LuaParser

# This class defines a complete generic visitor for a parse tree produced by LuaParser.

class LuaParserVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by LuaParser#chunk.
    def visitChunk(self, ctx:LuaParser.ChunkContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#block.
    def visitBlock(self, ctx:LuaParser.BlockContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#stat.
    def visitStat(self, ctx:LuaParser.StatContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#breakstat.
    def visitBreakstat(self, ctx:LuaParser.BreakstatContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#gotostat.
    def visitGotostat(self, ctx:LuaParser.GotostatContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#dostat.
    def visitDostat(self, ctx:LuaParser.DostatContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#whilestat.
    def visitWhilestat(self, ctx:LuaParser.WhilestatContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#repeatstat.
    def visitRepeatstat(self, ctx:LuaParser.RepeatstatContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#ifstat.
    def visitIfstat(self, ctx:LuaParser.IfstatContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#genericforstat.
    def visitGenericforstat(self, ctx:LuaParser.GenericforstatContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#numericforstat.
    def visitNumericforstat(self, ctx:LuaParser.NumericforstatContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#functionstat.
    def visitFunctionstat(self, ctx:LuaParser.FunctionstatContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#localfunctionstat.
    def visitLocalfunctionstat(self, ctx:LuaParser.LocalfunctionstatContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#localvariablestat.
    def visitLocalvariablestat(self, ctx:LuaParser.LocalvariablestatContext):
        return self.visitChildren(ctx)

    # Visit a parse tree produced by LuaParser#variablestat.
    def visitVariablestat(self, ctx:LuaParser.VariablestatContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#attnamelist.
    def visitAttnamelist(self, ctx:LuaParser.AttnamelistContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#attrib.
    def visitAttrib(self, ctx:LuaParser.AttribContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#retstat.
    def visitRetstat(self, ctx:LuaParser.RetstatContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#label.
    def visitLabel(self, ctx:LuaParser.LabelContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#funcname.
    def visitFuncname(self, ctx:LuaParser.FuncnameContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#variablelist.
    def visitVariablelist(self, ctx:LuaParser.VariablelistContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#namelist.
    def visitNamelist(self, ctx:LuaParser.NamelistContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#explist.
    def visitExplist(self, ctx:LuaParser.ExplistContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#exp.
    def visitExp(self, ctx:LuaParser.ExpContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#namedvariable.
    def visitNamedvariable(self, ctx:LuaParser.NamedvariableContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#parenthesesvariable.
    def visitParenthesesvariable(self, ctx:LuaParser.ParenthesesvariableContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#functioncall.
    def visitFunctioncall(self, ctx:LuaParser.FunctioncallContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#index.
    def visitIndex(self, ctx:LuaParser.IndexContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#nameAndArgs.
    def visitNameAndArgs(self, ctx:LuaParser.NameAndArgsContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#args.
    def visitArgs(self, ctx:LuaParser.ArgsContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#functiondef.
    def visitFunctiondef(self, ctx:LuaParser.FunctiondefContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#funcbody.
    def visitFuncbody(self, ctx:LuaParser.FuncbodyContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#parlist.
    def visitParlist(self, ctx:LuaParser.ParlistContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#tableconstructor.
    def visitTableconstructor(self, ctx:LuaParser.TableconstructorContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#fieldlist.
    def visitFieldlist(self, ctx:LuaParser.FieldlistContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#field.
    def visitField(self, ctx:LuaParser.FieldContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#fieldsep.
    def visitFieldsep(self, ctx:LuaParser.FieldsepContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#operatorOr.
    def visitOperatorOr(self, ctx:LuaParser.OperatorOrContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#operatorAnd.
    def visitOperatorAnd(self, ctx:LuaParser.OperatorAndContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#lessthan.
    def visitLessthan(self, ctx:LuaParser.LessthanContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#greaterthan.
    def visitGreaterthan(self, ctx:LuaParser.GreaterthanContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#lessthanorequal.
    def visitLessthanorequal(self, ctx:LuaParser.LessthanorequalContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#greaterthanorequal.
    def visitGreaterthanorequal(self, ctx:LuaParser.GreaterthanorequalContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#notequal.
    def visitNotequal(self, ctx:LuaParser.NotequalContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#equal.
    def visitEqual(self, ctx:LuaParser.EqualContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#operatorStrcat.
    def visitOperatorStrcat(self, ctx:LuaParser.OperatorStrcatContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#operatorAddSub.
    def visitOperatorAddSub(self, ctx:LuaParser.OperatorAddSubContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#operatorMulDivMod.
    def visitOperatorMulDivMod(self, ctx:LuaParser.OperatorMulDivModContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#operatorBitwise.
    def visitOperatorBitwise(self, ctx:LuaParser.OperatorBitwiseContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#operatorUnary.
    def visitOperatorUnary(self, ctx:LuaParser.OperatorUnaryContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#operatorPower.
    def visitOperatorPower(self, ctx:LuaParser.OperatorPowerContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#number.
    def visitNumber(self, ctx:LuaParser.NumberContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by LuaParser#lstring.
    def visitLstring(self, ctx:LuaParser.LstringContext):
        return self.visitChildren(ctx)



del LuaParser