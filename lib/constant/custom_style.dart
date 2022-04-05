import 'package:estore_test/constant/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomTheme{
  CustomTheme._();

  static style1() => ThemeData(
    fontFamily: 'GESS',
    primaryColor: CustomColors.primary,
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: CustomColors.primary,
      centerTitle: true,
      actionsIconTheme: IconThemeData(
        color: Colors.white
      )
    )
  );
}