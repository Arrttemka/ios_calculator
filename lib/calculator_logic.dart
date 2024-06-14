class CalculatorLogic {
  String userInput = '0';
  String result = '0';
  String? lastOperation;
  String? lastNumber;

  void enterNumber(String enteredDigit) {
    if (userInput == '0' && enteredDigit != '.') {
      userInput = '';
    }
    if (!(userInput.contains('.') && enteredDigit == '.') && userInput.length < 12) {
      userInput += enteredDigit;
    }
  }

  void clearInput() {
    userInput = '0';
    result = '0';
    lastOperation = null;
    lastNumber = null;
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

  void calculateResult() {
    if (lastOperation != null && lastNumber != null) {
      userInput = result + lastOperation! + lastNumber!;
    }
    try {
      double res = 0;
      if (userInput.contains('+')) {
        var parts = userInput.split('+');
        double part1 = double.parse(parts[0]);
        double part2 = double.parse(parts[1]);
        res = part1 + part2;
      } else if (userInput.contains('–')) {
        var parts = userInput.split('–');
        double part1 = double.parse(parts[0]);
        double part2 = double.parse(parts[1]);
        res = part1 - part2;
      } else if (userInput.contains('×')) {
        var parts = userInput.split('×');
        double part1 = double.parse(parts[0]);
        double part2 = double.parse(parts[1]);
        res = part1 * part2;
      } else if (userInput.contains('÷')) {
        var parts = userInput.split('÷');
        double part1 = double.parse(parts[0]);
        double part2 = double.parse(parts[1]);
        if (part2 != 0) {
          res = part1 / part2;
        } else {
          result = "Error";
          lastOperation = null;
          lastNumber = null;
          userInput = result;
          return;
        }
      } else {
        lastOperation = null;
        lastNumber = null;
      }

      if (res % 1 == 0) {  // Проверка, является ли число целым
        result = res.toInt().toString();
      } else {
        result = res.toString();
      }
    } catch (e) {
      result = "Error";
    }
    lastOperation = null;
    lastNumber = null;
    userInput = result;
  }
}