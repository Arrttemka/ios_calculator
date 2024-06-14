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
    if (!(userInput.contains('.') && enteredDigit == '.') &&
        userInput.length < 12) {
      userInput += enteredDigit;
    }
  }

  void changeSign() {
    if (userInput != '0') {
      if (double.tryParse(userInput)! > 0) {
        userInput = '–$userInput';
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


  List<String> toRPN(String input) {
    List<String> outputQueue = [];
    List<String> operatorStack = [];
    Map<String, int> precedence = {'+': 1, '–': 1, '×': 2, '÷': 2, 'n': 3};
    Map<String, int> associativity = {'+': 0, '–': 0, '×': 0, '÷': 0, 'n': 0};

    int i = 0;
    bool mayBeUnary = true;

    while (i < input.length) {
      String token = input[i];

      if ('0123456789.'.contains(token)) {
        String number = '';
        while (i < input.length && '0123456789.'.contains(input[i])) {
          number += input[i++];
        }
        outputQueue.add(number);
        mayBeUnary = false;
        continue;
      } else if ('+–×÷'.contains(token)) {
        if (token == '–' && mayBeUnary) {
          token = 'n';
        }
        while (!operatorStack.isEmpty &&
            precedence[operatorStack.last] != null &&
            ((associativity[token] == 0 &&
                precedence[token]! <= precedence[operatorStack.last]!) ||
                (associativity[token] == 1 &&
                    precedence[token]! < precedence[operatorStack.last]!))) {
          outputQueue.add(operatorStack.removeLast());
        }
        operatorStack.add(token);
        mayBeUnary = true;
      }
      i++;
    }

    while (!operatorStack.isEmpty) {
      outputQueue.add(operatorStack.removeLast());
    }
    return outputQueue;
  }



  double calculateFromRPN(List<String> tokens) {
    List<double> stack = [];
    for (String token in tokens) {
      if ('0123456789'.contains(token[0])) {
        stack.add(double.parse(token));
      } else {
        if (token == 'n') { // Unary minus
          double operand = stack.removeLast();
          stack.add(-operand);
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
    }
    return stack.first;
  }


  void calculateResult() {
    try {
      List<String> rpn = toRPN(userInput);
      double res = calculateFromRPN(rpn);
      if (res == res.toInt()) {
        result =
            res.toInt().toString();
      } else {
        result = res.toString();
      }
      userInput = result;
    } catch (e) {
      result = "Error";
      userInput = result;
    }
  }
}