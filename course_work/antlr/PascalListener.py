# Generated from Pascal.g4 by ANTLR 4.13.2
from antlr4 import *
if "." in __name__:
    from .PascalParser import PascalParser
else:
    from PascalParser import PascalParser

# This class defines a complete listener for a parse tree produced by PascalParser.
class PascalListener(ParseTreeListener):

    # Enter a parse tree produced by PascalParser#program.
    def enterProgram(self, ctx:PascalParser.ProgramContext):
        pass

    # Exit a parse tree produced by PascalParser#program.
    def exitProgram(self, ctx:PascalParser.ProgramContext):
        pass


    # Enter a parse tree produced by PascalParser#programHeading.
    def enterProgramHeading(self, ctx:PascalParser.ProgramHeadingContext):
        pass

    # Exit a parse tree produced by PascalParser#programHeading.
    def exitProgramHeading(self, ctx:PascalParser.ProgramHeadingContext):
        pass


    # Enter a parse tree produced by PascalParser#identifier.
    def enterIdentifier(self, ctx:PascalParser.IdentifierContext):
        pass

    # Exit a parse tree produced by PascalParser#identifier.
    def exitIdentifier(self, ctx:PascalParser.IdentifierContext):
        pass


    # Enter a parse tree produced by PascalParser#block.
    def enterBlock(self, ctx:PascalParser.BlockContext):
        pass

    # Exit a parse tree produced by PascalParser#block.
    def exitBlock(self, ctx:PascalParser.BlockContext):
        pass


    # Enter a parse tree produced by PascalParser#usesUnitsPart.
    def enterUsesUnitsPart(self, ctx:PascalParser.UsesUnitsPartContext):
        pass

    # Exit a parse tree produced by PascalParser#usesUnitsPart.
    def exitUsesUnitsPart(self, ctx:PascalParser.UsesUnitsPartContext):
        pass


    # Enter a parse tree produced by PascalParser#constantDefinitionPart.
    def enterConstantDefinitionPart(self, ctx:PascalParser.ConstantDefinitionPartContext):
        pass

    # Exit a parse tree produced by PascalParser#constantDefinitionPart.
    def exitConstantDefinitionPart(self, ctx:PascalParser.ConstantDefinitionPartContext):
        pass


    # Enter a parse tree produced by PascalParser#constantDefinition.
    def enterConstantDefinition(self, ctx:PascalParser.ConstantDefinitionContext):
        pass

    # Exit a parse tree produced by PascalParser#constantDefinition.
    def exitConstantDefinition(self, ctx:PascalParser.ConstantDefinitionContext):
        pass


    # Enter a parse tree produced by PascalParser#constantChr.
    def enterConstantChr(self, ctx:PascalParser.ConstantChrContext):
        pass

    # Exit a parse tree produced by PascalParser#constantChr.
    def exitConstantChr(self, ctx:PascalParser.ConstantChrContext):
        pass


    # Enter a parse tree produced by PascalParser#constant.
    def enterConstant(self, ctx:PascalParser.ConstantContext):
        pass

    # Exit a parse tree produced by PascalParser#constant.
    def exitConstant(self, ctx:PascalParser.ConstantContext):
        pass


    # Enter a parse tree produced by PascalParser#unsignedNumber.
    def enterUnsignedNumber(self, ctx:PascalParser.UnsignedNumberContext):
        pass

    # Exit a parse tree produced by PascalParser#unsignedNumber.
    def exitUnsignedNumber(self, ctx:PascalParser.UnsignedNumberContext):
        pass


    # Enter a parse tree produced by PascalParser#unsignedInteger.
    def enterUnsignedInteger(self, ctx:PascalParser.UnsignedIntegerContext):
        pass

    # Exit a parse tree produced by PascalParser#unsignedInteger.
    def exitUnsignedInteger(self, ctx:PascalParser.UnsignedIntegerContext):
        pass


    # Enter a parse tree produced by PascalParser#unsignedReal.
    def enterUnsignedReal(self, ctx:PascalParser.UnsignedRealContext):
        pass

    # Exit a parse tree produced by PascalParser#unsignedReal.
    def exitUnsignedReal(self, ctx:PascalParser.UnsignedRealContext):
        pass


    # Enter a parse tree produced by PascalParser#sign.
    def enterSign(self, ctx:PascalParser.SignContext):
        pass

    # Exit a parse tree produced by PascalParser#sign.
    def exitSign(self, ctx:PascalParser.SignContext):
        pass


    # Enter a parse tree produced by PascalParser#bool_.
    def enterBool_(self, ctx:PascalParser.Bool_Context):
        pass

    # Exit a parse tree produced by PascalParser#bool_.
    def exitBool_(self, ctx:PascalParser.Bool_Context):
        pass


    # Enter a parse tree produced by PascalParser#string.
    def enterString(self, ctx:PascalParser.StringContext):
        pass

    # Exit a parse tree produced by PascalParser#string.
    def exitString(self, ctx:PascalParser.StringContext):
        pass


    # Enter a parse tree produced by PascalParser#typeDefinitionPart.
    def enterTypeDefinitionPart(self, ctx:PascalParser.TypeDefinitionPartContext):
        pass

    # Exit a parse tree produced by PascalParser#typeDefinitionPart.
    def exitTypeDefinitionPart(self, ctx:PascalParser.TypeDefinitionPartContext):
        pass


    # Enter a parse tree produced by PascalParser#typeDefinition.
    def enterTypeDefinition(self, ctx:PascalParser.TypeDefinitionContext):
        pass

    # Exit a parse tree produced by PascalParser#typeDefinition.
    def exitTypeDefinition(self, ctx:PascalParser.TypeDefinitionContext):
        pass


    # Enter a parse tree produced by PascalParser#functionType.
    def enterFunctionType(self, ctx:PascalParser.FunctionTypeContext):
        pass

    # Exit a parse tree produced by PascalParser#functionType.
    def exitFunctionType(self, ctx:PascalParser.FunctionTypeContext):
        pass


    # Enter a parse tree produced by PascalParser#type_.
    def enterType_(self, ctx:PascalParser.Type_Context):
        pass

    # Exit a parse tree produced by PascalParser#type_.
    def exitType_(self, ctx:PascalParser.Type_Context):
        pass


    # Enter a parse tree produced by PascalParser#simpleType.
    def enterSimpleType(self, ctx:PascalParser.SimpleTypeContext):
        pass

    # Exit a parse tree produced by PascalParser#simpleType.
    def exitSimpleType(self, ctx:PascalParser.SimpleTypeContext):
        pass


    # Enter a parse tree produced by PascalParser#scalarType.
    def enterScalarType(self, ctx:PascalParser.ScalarTypeContext):
        pass

    # Exit a parse tree produced by PascalParser#scalarType.
    def exitScalarType(self, ctx:PascalParser.ScalarTypeContext):
        pass


    # Enter a parse tree produced by PascalParser#subrangeType.
    def enterSubrangeType(self, ctx:PascalParser.SubrangeTypeContext):
        pass

    # Exit a parse tree produced by PascalParser#subrangeType.
    def exitSubrangeType(self, ctx:PascalParser.SubrangeTypeContext):
        pass


    # Enter a parse tree produced by PascalParser#typeIdentifier.
    def enterTypeIdentifier(self, ctx:PascalParser.TypeIdentifierContext):
        pass

    # Exit a parse tree produced by PascalParser#typeIdentifier.
    def exitTypeIdentifier(self, ctx:PascalParser.TypeIdentifierContext):
        pass


    # Enter a parse tree produced by PascalParser#structuredType.
    def enterStructuredType(self, ctx:PascalParser.StructuredTypeContext):
        pass

    # Exit a parse tree produced by PascalParser#structuredType.
    def exitStructuredType(self, ctx:PascalParser.StructuredTypeContext):
        pass


    # Enter a parse tree produced by PascalParser#stringtype.
    def enterStringtype(self, ctx:PascalParser.StringtypeContext):
        pass

    # Exit a parse tree produced by PascalParser#stringtype.
    def exitStringtype(self, ctx:PascalParser.StringtypeContext):
        pass


    # Enter a parse tree produced by PascalParser#arrayType.
    def enterArrayType(self, ctx:PascalParser.ArrayTypeContext):
        pass

    # Exit a parse tree produced by PascalParser#arrayType.
    def exitArrayType(self, ctx:PascalParser.ArrayTypeContext):
        pass


    # Enter a parse tree produced by PascalParser#typeList.
    def enterTypeList(self, ctx:PascalParser.TypeListContext):
        pass

    # Exit a parse tree produced by PascalParser#typeList.
    def exitTypeList(self, ctx:PascalParser.TypeListContext):
        pass


    # Enter a parse tree produced by PascalParser#indexType.
    def enterIndexType(self, ctx:PascalParser.IndexTypeContext):
        pass

    # Exit a parse tree produced by PascalParser#indexType.
    def exitIndexType(self, ctx:PascalParser.IndexTypeContext):
        pass


    # Enter a parse tree produced by PascalParser#componentType.
    def enterComponentType(self, ctx:PascalParser.ComponentTypeContext):
        pass

    # Exit a parse tree produced by PascalParser#componentType.
    def exitComponentType(self, ctx:PascalParser.ComponentTypeContext):
        pass


    # Enter a parse tree produced by PascalParser#recordType.
    def enterRecordType(self, ctx:PascalParser.RecordTypeContext):
        pass

    # Exit a parse tree produced by PascalParser#recordType.
    def exitRecordType(self, ctx:PascalParser.RecordTypeContext):
        pass


    # Enter a parse tree produced by PascalParser#fieldList.
    def enterFieldList(self, ctx:PascalParser.FieldListContext):
        pass

    # Exit a parse tree produced by PascalParser#fieldList.
    def exitFieldList(self, ctx:PascalParser.FieldListContext):
        pass


    # Enter a parse tree produced by PascalParser#fixedPart.
    def enterFixedPart(self, ctx:PascalParser.FixedPartContext):
        pass

    # Exit a parse tree produced by PascalParser#fixedPart.
    def exitFixedPart(self, ctx:PascalParser.FixedPartContext):
        pass


    # Enter a parse tree produced by PascalParser#recordSection.
    def enterRecordSection(self, ctx:PascalParser.RecordSectionContext):
        pass

    # Exit a parse tree produced by PascalParser#recordSection.
    def exitRecordSection(self, ctx:PascalParser.RecordSectionContext):
        pass


    # Enter a parse tree produced by PascalParser#baseType.
    def enterBaseType(self, ctx:PascalParser.BaseTypeContext):
        pass

    # Exit a parse tree produced by PascalParser#baseType.
    def exitBaseType(self, ctx:PascalParser.BaseTypeContext):
        pass


    # Enter a parse tree produced by PascalParser#pointerType.
    def enterPointerType(self, ctx:PascalParser.PointerTypeContext):
        pass

    # Exit a parse tree produced by PascalParser#pointerType.
    def exitPointerType(self, ctx:PascalParser.PointerTypeContext):
        pass


    # Enter a parse tree produced by PascalParser#variableDeclarationPart.
    def enterVariableDeclarationPart(self, ctx:PascalParser.VariableDeclarationPartContext):
        pass

    # Exit a parse tree produced by PascalParser#variableDeclarationPart.
    def exitVariableDeclarationPart(self, ctx:PascalParser.VariableDeclarationPartContext):
        pass


    # Enter a parse tree produced by PascalParser#variableDeclaration.
    def enterVariableDeclaration(self, ctx:PascalParser.VariableDeclarationContext):
        pass

    # Exit a parse tree produced by PascalParser#variableDeclaration.
    def exitVariableDeclaration(self, ctx:PascalParser.VariableDeclarationContext):
        pass


    # Enter a parse tree produced by PascalParser#functionDeclarationPart.
    def enterFunctionDeclarationPart(self, ctx:PascalParser.FunctionDeclarationPartContext):
        pass

    # Exit a parse tree produced by PascalParser#functionDeclarationPart.
    def exitFunctionDeclarationPart(self, ctx:PascalParser.FunctionDeclarationPartContext):
        pass


    # Enter a parse tree produced by PascalParser#formalParameterList.
    def enterFormalParameterList(self, ctx:PascalParser.FormalParameterListContext):
        pass

    # Exit a parse tree produced by PascalParser#formalParameterList.
    def exitFormalParameterList(self, ctx:PascalParser.FormalParameterListContext):
        pass


    # Enter a parse tree produced by PascalParser#formalParameterSection.
    def enterFormalParameterSection(self, ctx:PascalParser.FormalParameterSectionContext):
        pass

    # Exit a parse tree produced by PascalParser#formalParameterSection.
    def exitFormalParameterSection(self, ctx:PascalParser.FormalParameterSectionContext):
        pass


    # Enter a parse tree produced by PascalParser#parameterGroup.
    def enterParameterGroup(self, ctx:PascalParser.ParameterGroupContext):
        pass

    # Exit a parse tree produced by PascalParser#parameterGroup.
    def exitParameterGroup(self, ctx:PascalParser.ParameterGroupContext):
        pass


    # Enter a parse tree produced by PascalParser#identifierList.
    def enterIdentifierList(self, ctx:PascalParser.IdentifierListContext):
        pass

    # Exit a parse tree produced by PascalParser#identifierList.
    def exitIdentifierList(self, ctx:PascalParser.IdentifierListContext):
        pass


    # Enter a parse tree produced by PascalParser#constList.
    def enterConstList(self, ctx:PascalParser.ConstListContext):
        pass

    # Exit a parse tree produced by PascalParser#constList.
    def exitConstList(self, ctx:PascalParser.ConstListContext):
        pass


    # Enter a parse tree produced by PascalParser#functionDeclaration.
    def enterFunctionDeclaration(self, ctx:PascalParser.FunctionDeclarationContext):
        pass

    # Exit a parse tree produced by PascalParser#functionDeclaration.
    def exitFunctionDeclaration(self, ctx:PascalParser.FunctionDeclarationContext):
        pass


    # Enter a parse tree produced by PascalParser#resultType.
    def enterResultType(self, ctx:PascalParser.ResultTypeContext):
        pass

    # Exit a parse tree produced by PascalParser#resultType.
    def exitResultType(self, ctx:PascalParser.ResultTypeContext):
        pass


    # Enter a parse tree produced by PascalParser#statement.
    def enterStatement(self, ctx:PascalParser.StatementContext):
        pass

    # Exit a parse tree produced by PascalParser#statement.
    def exitStatement(self, ctx:PascalParser.StatementContext):
        pass


    # Enter a parse tree produced by PascalParser#simpleStatement.
    def enterSimpleStatement(self, ctx:PascalParser.SimpleStatementContext):
        pass

    # Exit a parse tree produced by PascalParser#simpleStatement.
    def exitSimpleStatement(self, ctx:PascalParser.SimpleStatementContext):
        pass


    # Enter a parse tree produced by PascalParser#assignmentStatement.
    def enterAssignmentStatement(self, ctx:PascalParser.AssignmentStatementContext):
        pass

    # Exit a parse tree produced by PascalParser#assignmentStatement.
    def exitAssignmentStatement(self, ctx:PascalParser.AssignmentStatementContext):
        pass


    # Enter a parse tree produced by PascalParser#variable.
    def enterVariable(self, ctx:PascalParser.VariableContext):
        pass

    # Exit a parse tree produced by PascalParser#variable.
    def exitVariable(self, ctx:PascalParser.VariableContext):
        pass


    # Enter a parse tree produced by PascalParser#expression.
    def enterExpression(self, ctx:PascalParser.ExpressionContext):
        pass

    # Exit a parse tree produced by PascalParser#expression.
    def exitExpression(self, ctx:PascalParser.ExpressionContext):
        pass


    # Enter a parse tree produced by PascalParser#shiftExpression.
    def enterShiftExpression(self, ctx:PascalParser.ShiftExpressionContext):
        pass

    # Exit a parse tree produced by PascalParser#shiftExpression.
    def exitShiftExpression(self, ctx:PascalParser.ShiftExpressionContext):
        pass


    # Enter a parse tree produced by PascalParser#shiftOperator.
    def enterShiftOperator(self, ctx:PascalParser.ShiftOperatorContext):
        pass

    # Exit a parse tree produced by PascalParser#shiftOperator.
    def exitShiftOperator(self, ctx:PascalParser.ShiftOperatorContext):
        pass


    # Enter a parse tree produced by PascalParser#relationaloperator.
    def enterRelationaloperator(self, ctx:PascalParser.RelationaloperatorContext):
        pass

    # Exit a parse tree produced by PascalParser#relationaloperator.
    def exitRelationaloperator(self, ctx:PascalParser.RelationaloperatorContext):
        pass


    # Enter a parse tree produced by PascalParser#simpleExpression.
    def enterSimpleExpression(self, ctx:PascalParser.SimpleExpressionContext):
        pass

    # Exit a parse tree produced by PascalParser#simpleExpression.
    def exitSimpleExpression(self, ctx:PascalParser.SimpleExpressionContext):
        pass


    # Enter a parse tree produced by PascalParser#additiveoperator.
    def enterAdditiveoperator(self, ctx:PascalParser.AdditiveoperatorContext):
        pass

    # Exit a parse tree produced by PascalParser#additiveoperator.
    def exitAdditiveoperator(self, ctx:PascalParser.AdditiveoperatorContext):
        pass


    # Enter a parse tree produced by PascalParser#term.
    def enterTerm(self, ctx:PascalParser.TermContext):
        pass

    # Exit a parse tree produced by PascalParser#term.
    def exitTerm(self, ctx:PascalParser.TermContext):
        pass


    # Enter a parse tree produced by PascalParser#multiplicativeoperator.
    def enterMultiplicativeoperator(self, ctx:PascalParser.MultiplicativeoperatorContext):
        pass

    # Exit a parse tree produced by PascalParser#multiplicativeoperator.
    def exitMultiplicativeoperator(self, ctx:PascalParser.MultiplicativeoperatorContext):
        pass


    # Enter a parse tree produced by PascalParser#signedFactor.
    def enterSignedFactor(self, ctx:PascalParser.SignedFactorContext):
        pass

    # Exit a parse tree produced by PascalParser#signedFactor.
    def exitSignedFactor(self, ctx:PascalParser.SignedFactorContext):
        pass


    # Enter a parse tree produced by PascalParser#factor.
    def enterFactor(self, ctx:PascalParser.FactorContext):
        pass

    # Exit a parse tree produced by PascalParser#factor.
    def exitFactor(self, ctx:PascalParser.FactorContext):
        pass


    # Enter a parse tree produced by PascalParser#unsignedConstant.
    def enterUnsignedConstant(self, ctx:PascalParser.UnsignedConstantContext):
        pass

    # Exit a parse tree produced by PascalParser#unsignedConstant.
    def exitUnsignedConstant(self, ctx:PascalParser.UnsignedConstantContext):
        pass


    # Enter a parse tree produced by PascalParser#functionDesignator.
    def enterFunctionDesignator(self, ctx:PascalParser.FunctionDesignatorContext):
        pass

    # Exit a parse tree produced by PascalParser#functionDesignator.
    def exitFunctionDesignator(self, ctx:PascalParser.FunctionDesignatorContext):
        pass


    # Enter a parse tree produced by PascalParser#parameterList.
    def enterParameterList(self, ctx:PascalParser.ParameterListContext):
        pass

    # Exit a parse tree produced by PascalParser#parameterList.
    def exitParameterList(self, ctx:PascalParser.ParameterListContext):
        pass


    # Enter a parse tree produced by PascalParser#elementList.
    def enterElementList(self, ctx:PascalParser.ElementListContext):
        pass

    # Exit a parse tree produced by PascalParser#elementList.
    def exitElementList(self, ctx:PascalParser.ElementListContext):
        pass


    # Enter a parse tree produced by PascalParser#element.
    def enterElement(self, ctx:PascalParser.ElementContext):
        pass

    # Exit a parse tree produced by PascalParser#element.
    def exitElement(self, ctx:PascalParser.ElementContext):
        pass


    # Enter a parse tree produced by PascalParser#actualParameter.
    def enterActualParameter(self, ctx:PascalParser.ActualParameterContext):
        pass

    # Exit a parse tree produced by PascalParser#actualParameter.
    def exitActualParameter(self, ctx:PascalParser.ActualParameterContext):
        pass


    # Enter a parse tree produced by PascalParser#parameterwidth.
    def enterParameterwidth(self, ctx:PascalParser.ParameterwidthContext):
        pass

    # Exit a parse tree produced by PascalParser#parameterwidth.
    def exitParameterwidth(self, ctx:PascalParser.ParameterwidthContext):
        pass


    # Enter a parse tree produced by PascalParser#emptyStatement_.
    def enterEmptyStatement_(self, ctx:PascalParser.EmptyStatement_Context):
        pass

    # Exit a parse tree produced by PascalParser#emptyStatement_.
    def exitEmptyStatement_(self, ctx:PascalParser.EmptyStatement_Context):
        pass


    # Enter a parse tree produced by PascalParser#structuredStatement.
    def enterStructuredStatement(self, ctx:PascalParser.StructuredStatementContext):
        pass

    # Exit a parse tree produced by PascalParser#structuredStatement.
    def exitStructuredStatement(self, ctx:PascalParser.StructuredStatementContext):
        pass


    # Enter a parse tree produced by PascalParser#compoundStatement.
    def enterCompoundStatement(self, ctx:PascalParser.CompoundStatementContext):
        pass

    # Exit a parse tree produced by PascalParser#compoundStatement.
    def exitCompoundStatement(self, ctx:PascalParser.CompoundStatementContext):
        pass


    # Enter a parse tree produced by PascalParser#statements.
    def enterStatements(self, ctx:PascalParser.StatementsContext):
        pass

    # Exit a parse tree produced by PascalParser#statements.
    def exitStatements(self, ctx:PascalParser.StatementsContext):
        pass


    # Enter a parse tree produced by PascalParser#conditionalStatement.
    def enterConditionalStatement(self, ctx:PascalParser.ConditionalStatementContext):
        pass

    # Exit a parse tree produced by PascalParser#conditionalStatement.
    def exitConditionalStatement(self, ctx:PascalParser.ConditionalStatementContext):
        pass


    # Enter a parse tree produced by PascalParser#ifStatement.
    def enterIfStatement(self, ctx:PascalParser.IfStatementContext):
        pass

    # Exit a parse tree produced by PascalParser#ifStatement.
    def exitIfStatement(self, ctx:PascalParser.IfStatementContext):
        pass


    # Enter a parse tree produced by PascalParser#repetetiveStatement.
    def enterRepetetiveStatement(self, ctx:PascalParser.RepetetiveStatementContext):
        pass

    # Exit a parse tree produced by PascalParser#repetetiveStatement.
    def exitRepetetiveStatement(self, ctx:PascalParser.RepetetiveStatementContext):
        pass


    # Enter a parse tree produced by PascalParser#whileStatement.
    def enterWhileStatement(self, ctx:PascalParser.WhileStatementContext):
        pass

    # Exit a parse tree produced by PascalParser#whileStatement.
    def exitWhileStatement(self, ctx:PascalParser.WhileStatementContext):
        pass


    # Enter a parse tree produced by PascalParser#forStatement.
    def enterForStatement(self, ctx:PascalParser.ForStatementContext):
        pass

    # Exit a parse tree produced by PascalParser#forStatement.
    def exitForStatement(self, ctx:PascalParser.ForStatementContext):
        pass


    # Enter a parse tree produced by PascalParser#forList.
    def enterForList(self, ctx:PascalParser.ForListContext):
        pass

    # Exit a parse tree produced by PascalParser#forList.
    def exitForList(self, ctx:PascalParser.ForListContext):
        pass


    # Enter a parse tree produced by PascalParser#initialValue.
    def enterInitialValue(self, ctx:PascalParser.InitialValueContext):
        pass

    # Exit a parse tree produced by PascalParser#initialValue.
    def exitInitialValue(self, ctx:PascalParser.InitialValueContext):
        pass


    # Enter a parse tree produced by PascalParser#finalValue.
    def enterFinalValue(self, ctx:PascalParser.FinalValueContext):
        pass

    # Exit a parse tree produced by PascalParser#finalValue.
    def exitFinalValue(self, ctx:PascalParser.FinalValueContext):
        pass



del PascalParser