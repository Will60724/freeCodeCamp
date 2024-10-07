def arithmetic_arranger(problems, show_answers=False):
    
    if len(problems) > 5:
        return 'Error: Too many problems.'
    
    arranged_results = {
        '1st_line': '',
        '2nd_line' : '',
        'dash_line' : '',
        'answer_line' : ''
    }

    for problem in problems:
        operand_1, operator, operand_2 = problem.split()
        
        if operator != '+' and operator != '-':
            return "Error: Operator must be '+' or '-'."
        if not operand_1.isdigit():
            return 'Error: Numbers must only contain digits.'
        if not operand_2.isdigit():
            return 'Error: Numbers must only contain digits.'
        if len(operand_1) > 4:
            return 'Error: Numbers cannot be more than four digits.'
        if len(operand_2) > 4:
            return 'Error: Numbers cannot be more than four digits.'
        
        max_len = max(len(operand_1), len(operand_2)) + 2
        arranged_results['1st_line'] += operand_1.rjust(max_len) + '    '
        arranged_results['2nd_line'] += operator + ' ' + operand_2.rjust(max_len-2) + '    '
        arranged_results['dash_line'] += ''.rjust(max_len,'-') + '    '
    
        if show_answers:
            if operator == '+':
                answer = str(int(operand_1) + int(operand_2))
            else:
                answer = str(int(operand_1) - int(operand_2))
            arranged_results['answer_line'] += answer.rjust(max_len) + '    '

    result_display = arranged_results['1st_line'].rstrip() + '\n'
    result_display += arranged_results['2nd_line'].rstrip() + '\n'
    result_display += arranged_results['dash_line'].rstrip() + '\n'
    if show_answers:
        result_display += arranged_results['answer_line'].rstrip()

    return result_display

print(f'\n{arithmetic_arranger(["11 + 4", "3801 - 2999", "1 + 2", "123 + 49", "1 - 9380"])}')