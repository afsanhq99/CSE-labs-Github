def parse_input(input_tokens, parsing_table):
    stack = ['$', 'E']  # Initialize the stack with '$' and the start symbol 'E'
    input_tokens.append('$')  # Add '$' to the end of the input tokens for easier processing
    input_index = 0  # Index to keep track of the current position in the input tokens

    print("{:<30} {:<30} {:<30}".format("Stack", "Input", "Action"))
    print("=" * 80)

    while len(stack) > 0:
        top_of_stack = stack[-1]

        # If the top of the stack is a non-terminal symbol
        if top_of_stack in parsing_table:
            # If the current input token matches a production in the parsing table
            if input_tokens[input_index] in parsing_table[top_of_stack]:
                production = parsing_table[top_of_stack][input_tokens[input_index]]

                stack.pop()  # Pop the non-terminal symbol from the stack
                # If the production is not epsilon, add its components to the stack
                if production != ['ε']:
                    stack.extend(reversed(production))
                action = f"{top_of_stack}={''.join(production[::-1])}"
            else:
                print("Parsing error. No production found in the table.")
                return False
        # If the top of the stack is a terminal symbol
        elif top_of_stack == input_tokens[input_index]:
            stack.pop()  # Pop the terminal symbol from the stack
            input_index += 1  # Move to the next input token
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
    'E\'': {'+': ['+', 'T',
