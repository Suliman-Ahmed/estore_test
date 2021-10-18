import 'package:flutter/material.dart';
import 'package:get/get.dart';

///This custom text is used to unify the text style of the app
// ignore: must_be_immutable
class CustomText extends GetWidget {
  final String text;
  var padding;
  var textColor;
  var fontSize;
  var textAlign;
  var textDirection;
  var overflow;
  var iprefText;
  var font;
  var isBoldText;
  var line;

  CustomText({
    required this.text,
    this.padding,
    this.textColor,
    this.fontSize = 2,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.font = false,
    this.line = false,
    this.isBoldText = false,
    this.iprefText = false, //if the text should use the prefrences color
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0),
      child: GetX(
        builder: (s) {
          return Text(
            text.tr,
            overflow: overflow,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: isBoldText ? FontWeight.bold
                    : FontWeight.normal,
                // fontFamily: !font ? 'Tajawal' : 'TajawalBlack',
                decoration:
                line ? TextDecoration.lineThrough : TextDecoration.none),
            textAlign: textAlign,
            textDirection: textDirection,
          );
        },
      ),
    );
  }
}
