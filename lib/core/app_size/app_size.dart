import 'package:flutter/cupertino.dart';

class AppSize {
  static Size? _size;
  static Orientation? _orientation;
  static double? _designHeight;
  static double? _designWidth;
  static double? _mainSize;
  static double? _mainWidth;
  static double? _finalSize;
  static double? _finalWidthSize;
  static double? _screenHeight;
  static double? _screenWidth;

  static void init({BuildContext? context, double? designHeight, double? designWidth}) {
    _size = MediaQuery.of(context!).size;
    _orientation = MediaQuery.of(context).orientation;
    _designHeight = designHeight;
    _designWidth = designWidth;
    _screenHeight = _size!.height;
    _screenWidth = _size!.width;
    _mainSize = _orientation == Orientation.portrait
        ? _screenHeight! - MediaQuery.of(context).padding.top
        : _screenWidth! - MediaQuery.of(context).padding.top;
    _mainWidth = _orientation == Orientation.portrait ? _screenWidth : _screenHeight;
  }

  static double getHeight(double requiredSize) {
    _finalSize = _mainSize! * (requiredSize / _designHeight!);
    return _finalSize!;
  }

  static double getMainSize(double requiredSize) {
    _finalSize = _mainSize! * (requiredSize / _designHeight!);
    return _finalSize!;
  }

  static double getWidth(double requiredWidth) {
    _finalWidthSize = _mainWidth! * (requiredWidth / _designWidth!);
    return _finalWidthSize!;
  }
}
