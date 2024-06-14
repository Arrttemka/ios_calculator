import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final ButtonStyle buttonStyle;
  final TextStyle textStyle;
  final VoidCallback? onPressed;

  const CalcButton({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.buttonStyle,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Text(text, style: textStyle,),
    );
  }
}