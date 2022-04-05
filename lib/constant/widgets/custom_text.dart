import 'package:estore_test/app/modules/main_page/controllers/main_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomText extends GetWidget {
  final String text;
  var padding;
  var textColor;
  var fontSize;
  var textAlign;
  var textDirection;
  var overflow;
  var isBoldText;
  var line;
  var fontFamily;

  CustomText({
    required this.text,
    this.padding,
    this.textColor,
    this.fontSize,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.line = false,
    this.isBoldText = false,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0),
      child: GetX<MainPageController>(
        init: MainPageController(),
        builder: (s) {
          int ind = s.selectedIndex;
          return Text(
            text.tr,
            overflow: overflow,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: isBoldText ? FontWeight.w800 : FontWeight.normal,
                fontFamily: fontFamily,
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
