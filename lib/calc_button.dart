import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final ButtonStyle buttonStyle;
  final TextStyle textStyle;

  const CalcButton({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.buttonStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {}, // Тут должна быть ваша логика
      style: buttonStyle,
      child: Text(text, style: textStyle,),
    );
  }
}