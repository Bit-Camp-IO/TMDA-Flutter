import 'package:flutter/material.dart';
import 'package:tmda/core/util/assets_manager.dart';

class ThemeManager{
  static ThemeData darkTheme(){
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      fontFamily: AssetsManager.fontFamily
    );
  }
}