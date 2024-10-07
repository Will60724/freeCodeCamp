def arithmetic_arranger(problems, show_answers=False):
    if len(problems) > 5:
        return 'Error: Too many problems.'

    arranged_problems = {
        'top': [],
        'bottom': [],
        'line': [],
        'answer': []  # Include answer line
    }

    for problem in problems:
        operand_1, operator, operand_2 = problem.split()

        if operator not in ['+', '-']:
            return "Error: Operator must be '+' or '-'."

        if not operand_1.isdigit() or not operand_2.isdigit():
            return 'Error: Numbers must only contain digits.'

        if len(operand_1) > 4 or len(operand_2) > 4:
            return 'Error: Numbers cannot be more than four digits.'

        max_length = max(len(operand_1), len(operand_2))

        arranged_problems['top'].append(operand_1.rjust(max_length + 2))
        arranged_problems['bottom'].append(operator + ' ' + operand_2.rjust(max_length))
        arranged_problems['line'].append('-' * (max_length + 2))

        if show_answers:  # Calculate and include answer if needed
            if operator == '+':
                answer = str(int(operand_1) + int(operand_2))
            else:
                answer = str(int(operand_1) - int(operand_2))
            arranged_problems['answer'].append(answer.rjust(max_length + 2))

    arranged_lines = [
        '    '.join(arranged_problems['top']),
        '    '.join(arranged_problems['bottom']),
        '    '.join(arranged_problems['line'])
    ]
    
    # Add answer line if show_answers is True
    if show_answers:
        arranged_lines.append('    '.join(arranged_problems['answer']))

    return '\n'.join(arranged_lines)

print(f'\n{arithmetic_arranger(["3801 - 2", "123 + 49"])}')