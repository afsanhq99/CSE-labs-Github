import re
with open("lab1.txt") as f:

    input_string = f.read()
keywords_pattern = r"\b(int|float|if|else)\b"
keywords = re.findall(keywords_pattern, input_string)

identifiers_pattern = r"\b[a-zA-Z_][a-zA-Z0-9_]*\b"
keywords = set(["int", "float", "if", "else"])  # Specify the keywords here
identifiers = [match for match in re.findall(
    identifiers_pattern, input_string) if match not in keywords]


math_operators_pattern = r"[-+=]"
math_operators = re.findall(math_operators_pattern, input_string)

logical_operators_pattern = r">"
logical_operators = re.findall(logical_operators_pattern, input_string)

numerical_values_pattern = r"\b\d+(?:\.\d+)?\b"
numerical_values = re.findall(numerical_values_pattern, input_string)

others_pattern = r"[,;(){}]"
others = re.findall(others_pattern, input_string)

print("keywords ", list(set(keywords)))
print("identifers ", list(set(identifiers)))
print("math operators ", list(set(math_operators)))
print("numerical values ", list(set(numerical_values)))
print("others ", list(set(others)))
#test