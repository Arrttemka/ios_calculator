import 'package:flutter/material.dart';
import 'styles.dart';
import 'calc_button.dart';
import 'package:hexcolor/hexcolor.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  String
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#151515"),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 40, 19, 0),
                alignment: Alignment.bottomRight,
                child: Text(
                  userInput,
                  style: TextStyle(
                    color: HexColor("#FFFFFF"),
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 70, 19, 50),
                alignment: Alignment.bottomRight,
                child: Text(
                  "9",
                  style: TextStyle(
                    color: HexColor("#969696"),
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Container(height: 1, color: HexColor("#4E4D4D")),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  buttonRow(["C", "+/-", "%", "÷"], [clearButtonStyle, numberButtonStyle, numberButtonStyle, numberButtonStyle], [numberTextStyle, operationsTextStyle, operationsTextStyle, operationsTextStyle],),
                  const SizedBox(height: 20),
                  buttonRow(["7", "8", "9", "×"], [numberButtonStyle, numberButtonStyle, numberButtonStyle, numberButtonStyle], [numberTextStyle, numberTextStyle, numberTextStyle, operationsTextStyle],),
                  const SizedBox(height: 20),
                  buttonRow(["4", "5", "6", "–"], [numberButtonStyle, numberButtonStyle, numberButtonStyle, numberButtonStyle], [numberTextStyle, numberTextStyle, numberTextStyle, operationsTextStyle],),
                  const SizedBox(height: 20),
                  buttonRow(
                    ["1", "2", "3", "+"],
                    [numberButtonStyle, numberButtonStyle, numberButtonStyle, numberButtonStyle],
                    [numberTextStyle, numberTextStyle, numberTextStyle, operationsTextStyle],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      CalcButton(text: "0", buttonStyle: numberButtonStyle, textStyle: numberTextStyle,),
                      const SizedBox(width: 20),
                      CalcButton(text: ".", buttonStyle: numberButtonStyle, textStyle: numberTextStyle,),
                      const SizedBox(width: 20),
                      CalcButton(text: "=", buttonStyle: equalsButtonStyle, textStyle: numberTextStyle,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buttonRow(List<String> labels, List<ButtonStyle> buttonStyles, List<TextStyle> textStyles) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(labels.length, (index) => CalcButton(text: labels[index], buttonStyle: buttonStyles[index], textStyle: textStyles[index],)),
    );
  }
}