
keywords =  [
    "auto", "break", "case", "char", "const", "continue",
    "default", "do", "double", "else", "enum", "extern",
    "float", "for", "goto", "if", "int", "long",
    "register", "return", "short", "signed", "sizeof", "static",
    "struct", "switch", "typedef", "union", "unsigned", "void",
    "volatile", "while"
]
math_operators = ["+", "-", "*", "/", "="]
logical_operators = ["<", ">"]
others = [",", ";", "(", ")", "{", "}"]

keywordsList = []
mathOperatorList = []
logicalOperatorList = []
othersList = []
identifiersList = []
numericalValueList = []

def lexicalAnalyzer(x):

    if x.endswith(tuple(others)):
        othersList.append(x[-1])
        x = x[0:-1]

    if x in keywords:
        keywordsList.append(x)
    elif x in math_operators:
        mathOperatorList.append(x)
    elif x in logical_operators:
        logicalOperatorList.append(x)
    elif x in others:
        othersList.append(x)
    else:
        if x.isdigit():
            x = str(int(x))
            numericalValueList.append(x)
        else:
            if "." in x:
                if x not in numericalValueList:
                    numericalValueList.append(str(x))
            elif "10.0E" in x:
                if x not in numericalValueList:
                    numericalValueList.append(str(x))
            elif "-" in x:
                numericalValueList.append(str(x))

            else:
                identifiersList.append(x)
# input_text = open("420 lab1.txt", "r")
with open("lab1.txt") as f:

    for line in f:
        lineStr = line.strip()

        lineStr = lineStr.split()
        # print(lineStr)
        for word in lineStr:
            lexicalAnalyzer(word) #function call

#removing empty string from the identifiers
ide=set(identifiersList)
ide.discard(" ")


print("Keywords: ", end="")
print(*set(keywordsList) ,sep=", ")

print("Identifiers: ", end="")
print(*ide ,sep=", ")

print("Math Operators: ", end="")
print(*set(mathOperatorList), sep=", ")

print("Logical Operators: ", end="")
print(*set(logicalOperatorList), sep=", ")

print("Numerical Values: ", end="")
print(*set(numericalValueList), sep=", ")

print("Others: ", end="")
print(*set(othersList) ,sep=" ")