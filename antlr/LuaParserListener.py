# Generated from LuaParser.g4 by ANTLR 4.13.2
from antlr4 import *
if "." in __name__:
    from .LuaParser import LuaParser
else:
    from LuaParser import LuaParser

# This class defines a complete listener for a parse tree produced by LuaParser.
class LuaParserListener(ParseTreeListener):

    # Enter a parse tree produced by LuaParser#chunk.
    def enterChunk(self, ctx:LuaParser.ChunkContext):
        pass

    # Exit a parse tree produced by LuaParser#chunk.
    def exitChunk(self, ctx:LuaParser.ChunkContext):
        pass


    # Enter a parse tree produced by LuaParser#block.
    def enterBlock(self, ctx:LuaParser.BlockContext):
        pass

    # Exit a parse tree produced by LuaParser#block.
    def exitBlock(self, ctx:LuaParser.BlockContext):
        pass


    # Enter a parse tree produced by LuaParser#stat.
    def enterStat(self, ctx:LuaParser.StatContext):
        pass

    # Exit a parse tree produced by LuaParser#stat.
    def exitStat(self, ctx:LuaParser.StatContext):
        pass


    # Enter a parse tree produced by LuaParser#breakstat.
    def enterBreakstat(self, ctx:LuaParser.BreakstatContext):
        pass

    # Exit a parse tree produced by LuaParser#breakstat.
    def exitBreakstat(self, ctx:LuaParser.BreakstatContext):
        pass


    # Enter a parse tree produced by LuaParser#gotostat.
    def enterGotostat(self, ctx:LuaParser.GotostatContext):
        pass

    # Exit a parse tree produced by LuaParser#gotostat.
    def exitGotostat(self, ctx:LuaParser.GotostatContext):
        pass


    # Enter a parse tree produced by LuaParser#dostat.
    def enterDostat(self, ctx:LuaParser.DostatContext):
        pass

    # Exit a parse tree produced by LuaParser#dostat.
    def exitDostat(self, ctx:LuaParser.DostatContext):
        pass


    # Enter a parse tree produced by LuaParser#whilestat.
    def enterWhilestat(self, ctx:LuaParser.WhilestatContext):
        pass

    # Exit a parse tree produced by LuaParser#whilestat.
    def exitWhilestat(self, ctx:LuaParser.WhilestatContext):
        pass


    # Enter a parse tree produced by LuaParser#repeatstat.
    def enterRepeatstat(self, ctx:LuaParser.RepeatstatContext):
        pass

    # Exit a parse tree produced by LuaParser#repeatstat.
    def exitRepeatstat(self, ctx:LuaParser.RepeatstatContext):
        pass


    # Enter a parse tree produced by LuaParser#ifstat.
    def enterIfstat(self, ctx:LuaParser.IfstatContext):
        pass

    # Exit a parse tree produced by LuaParser#ifstat.
    def exitIfstat(self, ctx:LuaParser.IfstatContext):
        pass


    # Enter a parse tree produced by LuaParser#genericforstat.
    def enterGenericforstat(self, ctx:LuaParser.GenericforstatContext):
        pass

    # Exit a parse tree produced by LuaParser#genericforstat.
    def exitGenericforstat(self, ctx:LuaParser.GenericforstatContext):
        pass


    # Enter a parse tree produced by LuaParser#numericforstat.
    def enterNumericforstat(self, ctx:LuaParser.NumericforstatContext):
        pass

    # Exit a parse tree produced by LuaParser#numericforstat.
    def exitNumericforstat(self, ctx:LuaParser.NumericforstatContext):
        pass


    # Enter a parse tree produced by LuaParser#functionstat.
    def enterFunctionstat(self, ctx:LuaParser.FunctionstatContext):
        pass

    # Exit a parse tree produced by LuaParser#functionstat.
    def exitFunctionstat(self, ctx:LuaParser.FunctionstatContext):
        pass


    # Enter a parse tree produced by LuaParser#localfunctionstat.
    def enterLocalfunctionstat(self, ctx:LuaParser.LocalfunctionstatContext):
        pass

    # Exit a parse tree produced by LuaParser#localfunctionstat.
    def exitLocalfunctionstat(self, ctx:LuaParser.LocalfunctionstatContext):
        pass


    # Enter a parse tree produced by LuaParser#localvariablestat.
    def enterLocalvariablestat(self, ctx:LuaParser.LocalvariablestatContext):
        pass

    # Exit a parse tree produced by LuaParser#localvariablestat.
    def exitLocalvariablestat(self, ctx:LuaParser.LocalvariablestatContext):
        pass


    # Enter a parse tree produced by LuaParser#variablestat.
    def enterVariablestat(self, ctx:LuaParser.VariablestatContext):
        pass

    # Exit a parse tree produced by LuaParser#variablestat.
    def exitVariablestat(self, ctx:LuaParser.VariablestatContext):
        pass


    # Enter a parse tree produced by LuaParser#attnamelist.
    def enterAttnamelist(self, ctx:LuaParser.AttnamelistContext):
        pass

    # Exit a parse tree produced by LuaParser#attnamelist.
    def exitAttnamelist(self, ctx:LuaParser.AttnamelistContext):
        pass


    # Enter a parse tree produced by LuaParser#attrib.
    def enterAttrib(self, ctx:LuaParser.AttribContext):
        pass

    # Exit a parse tree produced by LuaParser#attrib.
    def exitAttrib(self, ctx:LuaParser.AttribContext):
        pass


    # Enter a parse tree produced by LuaParser#retstat.
    def enterRetstat(self, ctx:LuaParser.RetstatContext):
        pass

    # Exit a parse tree produced by LuaParser#retstat.
    def exitRetstat(self, ctx:LuaParser.RetstatContext):
        pass


    # Enter a parse tree produced by LuaParser#label.
    def enterLabel(self, ctx:LuaParser.LabelContext):
        pass

    # Exit a parse tree produced by LuaParser#label.
    def exitLabel(self, ctx:LuaParser.LabelContext):
        pass


    # Enter a parse tree produced by LuaParser#funcname.
    def enterFuncname(self, ctx:LuaParser.FuncnameContext):
        pass

    # Exit a parse tree produced by LuaParser#funcname.
    def exitFuncname(self, ctx:LuaParser.FuncnameContext):
        pass


    # Enter a parse tree produced by LuaParser#variablelist.
    def enterVariablelist(self, ctx:LuaParser.VariablelistContext):
        pass

    # Exit a parse tree produced by LuaParser#variablelist.
    def exitVariablelist(self, ctx:LuaParser.VariablelistContext):
        pass


    # Enter a parse tree produced by LuaParser#namelist.
    def enterNamelist(self, ctx:LuaParser.NamelistContext):
        pass

    # Exit a parse tree produced by LuaParser#namelist.
    def exitNamelist(self, ctx:LuaParser.NamelistContext):
        pass


    # Enter a parse tree produced by LuaParser#explist.
    def enterExplist(self, ctx:LuaParser.ExplistContext):
        pass

    # Exit a parse tree produced by LuaParser#explist.
    def exitExplist(self, ctx:LuaParser.ExplistContext):
        pass


    # Enter a parse tree produced by LuaParser#exp.
    def enterExp(self, ctx:LuaParser.ExpContext):
        pass

    # Exit a parse tree produced by LuaParser#exp.
    def exitExp(self, ctx:LuaParser.ExpContext):
        pass


    # Enter a parse tree produced by LuaParser#namedvariable.
    def enterNamedvariable(self, ctx:LuaParser.NamedvariableContext):
        pass

    # Exit a parse tree produced by LuaParser#namedvariable.
    def exitNamedvariable(self, ctx:LuaParser.NamedvariableContext):
        pass


    # Enter a parse tree produced by LuaParser#parenthesesvariable.
    def enterParenthesesvariable(self, ctx:LuaParser.ParenthesesvariableContext):
        pass

    # Exit a parse tree produced by LuaParser#parenthesesvariable.
    def exitParenthesesvariable(self, ctx:LuaParser.ParenthesesvariableContext):
        pass


    # Enter a parse tree produced by LuaParser#functioncall.
    def enterFunctioncall(self, ctx:LuaParser.FunctioncallContext):
        pass

    # Exit a parse tree produced by LuaParser#functioncall.
    def exitFunctioncall(self, ctx:LuaParser.FunctioncallContext):
        pass


    # Enter a parse tree produced by LuaParser#index.
    def enterIndex(self, ctx:LuaParser.IndexContext):
        pass

    # Exit a parse tree produced by LuaParser#index.
    def exitIndex(self, ctx:LuaParser.IndexContext):
        pass


    # Enter a parse tree produced by LuaParser#nameAndArgs.
    def enterNameAndArgs(self, ctx:LuaParser.NameAndArgsContext):
        pass

    # Exit a parse tree produced by LuaParser#nameAndArgs.
    def exitNameAndArgs(self, ctx:LuaParser.NameAndArgsContext):
        pass


    # Enter a parse tree produced by LuaParser#args.
    def enterArgs(self, ctx:LuaParser.ArgsContext):
        pass

    # Exit a parse tree produced by LuaParser#args.
    def exitArgs(self, ctx:LuaParser.ArgsContext):
        pass


    # Enter a parse tree produced by LuaParser#functiondef.
    def enterFunctiondef(self, ctx:LuaParser.FunctiondefContext):
        pass

    # Exit a parse tree produced by LuaParser#functiondef.
    def exitFunctiondef(self, ctx:LuaParser.FunctiondefContext):
        pass


    # Enter a parse tree produced by LuaParser#funcbody.
    def enterFuncbody(self, ctx:LuaParser.FuncbodyContext):
        pass

    # Exit a parse tree produced by LuaParser#funcbody.
    def exitFuncbody(self, ctx:LuaParser.FuncbodyContext):
        pass


    # Enter a parse tree produced by LuaParser#parlist.
    def enterParlist(self, ctx:LuaParser.ParlistContext):
        pass

    # Exit a parse tree produced by LuaParser#parlist.
    def exitParlist(self, ctx:LuaParser.ParlistContext):
        pass


    # Enter a parse tree produced by LuaParser#tableconstructor.
    def enterTableconstructor(self, ctx:LuaParser.TableconstructorContext):
        pass

    # Exit a parse tree produced by LuaParser#tableconstructor.
    def exitTableconstructor(self, ctx:LuaParser.TableconstructorContext):
        pass


    # Enter a parse tree produced by LuaParser#fieldlist.
    def enterFieldlist(self, ctx:LuaParser.FieldlistContext):
        pass

    # Exit a parse tree produced by LuaParser#fieldlist.
    def exitFieldlist(self, ctx:LuaParser.FieldlistContext):
        pass


    # Enter a parse tree produced by LuaParser#field.
    def enterField(self, ctx:LuaParser.FieldContext):
        pass

    # Exit a parse tree produced by LuaParser#field.
    def exitField(self, ctx:LuaParser.FieldContext):
        pass


    # Enter a parse tree produced by LuaParser#fieldsep.
    def enterFieldsep(self, ctx:LuaParser.FieldsepContext):
        pass

    # Exit a parse tree produced by LuaParser#fieldsep.
    def exitFieldsep(self, ctx:LuaParser.FieldsepContext):
        pass


    # Enter a parse tree produced by LuaParser#operatorOr.
    def enterOperatorOr(self, ctx:LuaParser.OperatorOrContext):
        pass

    # Exit a parse tree produced by LuaParser#operatorOr.
    def exitOperatorOr(self, ctx:LuaParser.OperatorOrContext):
        pass


    # Enter a parse tree produced by LuaParser#operatorAnd.
    def enterOperatorAnd(self, ctx:LuaParser.OperatorAndContext):
        pass

    # Exit a parse tree produced by LuaParser#operatorAnd.
    def exitOperatorAnd(self, ctx:LuaParser.OperatorAndContext):
        pass


    # Enter a parse tree produced by LuaParser#lessthan.
    def enterLessthan(self, ctx:LuaParser.LessthanContext):
        pass

    # Exit a parse tree produced by LuaParser#lessthan.
    def exitLessthan(self, ctx:LuaParser.LessthanContext):
        pass


    # Enter a parse tree produced by LuaParser#greaterthan.
    def enterGreaterthan(self, ctx:LuaParser.GreaterthanContext):
        pass

    # Exit a parse tree produced by LuaParser#greaterthan.
    def exitGreaterthan(self, ctx:LuaParser.GreaterthanContext):
        pass


    # Enter a parse tree produced by LuaParser#lessthanorequal.
    def enterLessthanorequal(self, ctx:LuaParser.LessthanorequalContext):
        pass

    # Exit a parse tree produced by LuaParser#lessthanorequal.
    def exitLessthanorequal(self, ctx:LuaParser.LessthanorequalContext):
        pass


    # Enter a parse tree produced by LuaParser#greaterthanorequal.
    def enterGreaterthanorequal(self, ctx:LuaParser.GreaterthanorequalContext):
        pass

    # Exit a parse tree produced by LuaParser#greaterthanorequal.
    def exitGreaterthanorequal(self, ctx:LuaParser.GreaterthanorequalContext):
        pass


    # Enter a parse tree produced by LuaParser#notequal.
    def enterNotequal(self, ctx:LuaParser.NotequalContext):
        pass

    # Exit a parse tree produced by LuaParser#notequal.
    def exitNotequal(self, ctx:LuaParser.NotequalContext):
        pass


    # Enter a parse tree produced by LuaParser#equal.
    def enterEqual(self, ctx:LuaParser.EqualContext):
        pass

    # Exit a parse tree produced by LuaParser#equal.
    def exitEqual(self, ctx:LuaParser.EqualContext):
        pass


    # Enter a parse tree produced by LuaParser#operatorStrcat.
    def enterOperatorStrcat(self, ctx:LuaParser.OperatorStrcatContext):
        pass

    # Exit a parse tree produced by LuaParser#operatorStrcat.
    def exitOperatorStrcat(self, ctx:LuaParser.OperatorStrcatContext):
        pass


    # Enter a parse tree produced by LuaParser#operatorAddSub.
    def enterOperatorAddSub(self, ctx:LuaParser.OperatorAddSubContext):
        pass

    # Exit a parse tree produced by LuaParser#operatorAddSub.
    def exitOperatorAddSub(self, ctx:LuaParser.OperatorAddSubContext):
        pass


    # Enter a parse tree produced by LuaParser#operatorMulDivMod.
    def enterOperatorMulDivMod(self, ctx:LuaParser.OperatorMulDivModContext):
        pass

    # Exit a parse tree produced by LuaParser#operatorMulDivMod.
    def exitOperatorMulDivMod(self, ctx:LuaParser.OperatorMulDivModContext):
        pass


    # Enter a parse tree produced by LuaParser#operatorBitwise.
    def enterOperatorBitwise(self, ctx:LuaParser.OperatorBitwiseContext):
        pass

    # Exit a parse tree produced by LuaParser#operatorBitwise.
    def exitOperatorBitwise(self, ctx:LuaParser.OperatorBitwiseContext):
        pass


    # Enter a parse tree produced by LuaParser#operatorUnary.
    def enterOperatorUnary(self, ctx:LuaParser.OperatorUnaryContext):
        pass

    # Exit a parse tree produced by LuaParser#operatorUnary.
    def exitOperatorUnary(self, ctx:LuaParser.OperatorUnaryContext):
        pass


    # Enter a parse tree produced by LuaParser#operatorPower.
    def enterOperatorPower(self, ctx:LuaParser.OperatorPowerContext):
        pass

    # Exit a parse tree produced by LuaParser#operatorPower.
    def exitOperatorPower(self, ctx:LuaParser.OperatorPowerContext):
        pass


    # Enter a parse tree produced by LuaParser#number.
    def enterNumber(self, ctx:LuaParser.NumberContext):
        pass

    # Exit a parse tree produced by LuaParser#number.
    def exitNumber(self, ctx:LuaParser.NumberContext):
        pass


    # Enter a parse tree produced by LuaParser#lstring.
    def enterLstring(self, ctx:LuaParser.LstringContext):
        pass

    # Exit a parse tree produced by LuaParser#lstring.
    def exitLstring(self, ctx:LuaParser.LstringContext):
        pass



del LuaParser