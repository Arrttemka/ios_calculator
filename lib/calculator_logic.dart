class CalculatorLogic {
  String userInput = '0';
  String result = '0';

  void clearInput() {
    userInput = '0';
    result = '0';
  }

  void enterNumber(String enteredDigit) {
    if (userInput == '0' && enteredDigit != '.') {
      userInput = '';
    }
    if (!(userInput.contains('.') && enteredDigit == '.') && userInput.length < 12) {
      userInput += enteredDigit;
    }
  }
  void changeSign() {
    if (userInput != '0') {
      if (double.tryParse(userInput)! > 0) {
        userInput = '-$userInput';
      } else {
        userInput = userInput.substring(1);
      }
    }
  }

  void percentResult() {
    if (userInput != '0') {
      double? parsedNumber = double.tryParse(userInput);
      if (parsedNumber != null) {
        result = (parsedNumber / 100).toStringAsFixed(2);
        userInput = result;
      }
    }
  }

  // Преобразование входной строки в RPN
  List<String> toRPN(String input) {
    List<String> outputQueue = [];
    List<String> operatorStack = [];
    Map<String, int> precedence = {'+': 1, '–': 1, '×': 2, '÷': 2};
    Map<String, int> associativity = {'+': 0, '–': 0, '×': 0, '÷': 0};  // 0 - left, 1 - right

    int i = 0;
    while (i < input.length) {
      String token = input[i];
      if ('0123456789.'.contains(token)) {
        String number = '';
        while (i < input.length && '0123456789.'.contains(input[i])) {
          number += input[i];
          i++;
        }
        outputQueue.add(number);
        continue;
      } else if ('+–×÷'.contains(token)) {
        while (operatorStack.isNotEmpty &&
            '×÷+–'.contains(operatorStack.last) &&
            ((associativity[token] == 0 && precedence[token]! <= precedence[operatorStack.last]!) ||
                (associativity[token] == 1 && precedence[token]! < precedence[operatorStack.last]!))) {
          outputQueue.add(operatorStack.removeLast());
        }
        operatorStack.add(token);
      }
      i++;
    }

    while (operatorStack.isNotEmpty) {
      outputQueue.add(operatorStack.removeLast());
    }
    return outputQueue;
  }

  // Вычисление результата из RPN
  double calculateFromRPN(List<String> tokens) {
    List<double> stack = [];
    for (String token in tokens) {
      if ('0123456789'.contains(token[0])) {
        stack.add(double.parse(token));
      } else {
        double secondOperand = stack.removeLast();
        double firstOperand = stack.removeLast();
        switch (token) {
          case '+':
            stack.add(firstOperand + secondOperand);
            break;
          case '–':
            stack.add(firstOperand - secondOperand);
            break;
          case '×':
            stack.add(firstOperand * secondOperand);
            break;
          case '÷':
            if (secondOperand == 0) throw Exception('Division by zero');
            stack.add(firstOperand / secondOperand);
            break;
        }
      }
    }
    return stack.first;
  }

  void calculateResult() {
    try {
      List<String> rpn = toRPN(userInput);
      double res = calculateFromRPN(rpn);
      result = res.toString();
      userInput = result;
    } catch (e) {
      result = "Error";
      userInput = result;
    }
  }
}