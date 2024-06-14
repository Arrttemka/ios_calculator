import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final numberButtonStyle = ButtonStyle(
  padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
  shape: WidgetStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(9)))),
  fixedSize: WidgetStateProperty.all(const Size(73, 71)),
  backgroundColor: WidgetStateProperty.all(HexColor("#343434")),
);

final numberTextStyle = TextStyle(color: HexColor("#FFFFFF"), fontSize: 36, fontWeight: FontWeight.w400);
final operationsTextStyle = TextStyle(color: HexColor("#66FF7F"), fontSize: 26, fontWeight: FontWeight.w400);

final clearButtonStyle = numberButtonStyle.copyWith(
  backgroundColor: WidgetStateProperty.all(HexColor("#FF5959")),
);

final equalsButtonStyle = ButtonStyle(
  padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
  shape: WidgetStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(9)))),
  fixedSize: WidgetStateProperty.all(const Size(166, 71)),
  backgroundColor: WidgetStateProperty.all(HexColor("#66FF7F")),
);