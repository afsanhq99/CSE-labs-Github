def parse_input(input_tokens, parsing_table):
    stack = ['$', 'E']  # Initialize the stack with '$' and the start symbol 'E'
    input_tokens.append('$')  # Add '$' to the end of the input tokens for easier processing
    input_index = 0  # Index to keep track of the current position in the input tokens

    print("{:<30} {:<30} {:<30}".format("Stack", "Input", "Action"))
    print("=" * 80)

    while len(stack) > 0:
        top_of_stack = stack[-1]

        if top_of_stack in parsing_table: #grammer ta mille
            if input_tokens[input_index] in parsing_table[top_of_stack]: #first dictionary te value acces korbe id"
                production = parsing_table[top_of_stack][input_tokens[input_index]]    #E -> T E'

                stack.pop() # E -> T E' er E ke pop kore T E' add kore
                if production != ['ε']:
                    stack.extend(reversed(production))   #E -> T E' er E ke pop kore T E' add kore
                action = f"{top_of_stack}={''.join(production[::-1])}"
            else:
                print("Parsing error. No production found in the table.")
                return False
        elif top_of_stack == input_tokens[input_index]:  #direct mile gele jemon "id"
            stack.pop()
            input_index += 1
            action = "POP ACTION"
        else:
            print("Parsing error. Stack top and input mismatch.")
            return False

        stack_str = ''.join(stack)
        input_str = ''.join(input_tokens[input_index:])
        print("{:<30} {:<30} {:<30}".format(stack_str, input_str, action))

    print("=" * 80)

    if input_index == len(input_tokens):
        print("Input string is successfully parsed.")
        return True
    else:
        print("Parsing error. Input string not fully parsed.")
        return False


# Define the corrected parsing table
parsing_table = {
    'E': {'id': ['T', 'E\''], '(': ['T', 'E\'']},
    'E\'': {'+': ['+', 'T', 'E\''], ')': ['ε'], '$': ['ε']},
    'T': {'id': ['F', 'T\''], '(': ['F', 'T\'']},
    'T\'': {'+': ['ε'], '*': ['*', 'F', 'T\''], ')': ['ε'], '$': ['ε']},
    'F': {'id': ['id'], '(': ['(', 'E', ')']}
}

# Test the parser with the example input as a list of tokens
input_tokens = ['id', '+', '(', 'id', '*', 'id', ')']
parse_input(input_tokens, parsing_table)
