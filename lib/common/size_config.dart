import 'package:flutter/cupertino.dart';

class SizeConfig {
  static const double DESIGN_WIDTH = 375.0;
  static const double DESIGN_HEIGHT = 812.0;

  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double pixelRatio;
  static late Orientation orientation;
  static bool isTablet = false;
  static bool isDarkMode = false;

  static void init(BuildContext context) async {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    pixelRatio = _mediaQueryData.devicePixelRatio;
    orientation = _mediaQueryData.orientation;
    isDarkMode = _mediaQueryData.platformBrightness == Brightness.dark;

    print("screenWidth $screenWidth");
    print("screenHeight $screenHeight");
    print("pixelRatio $pixelRatio");
    print("orientation $orientation");
    print("isDarkMode $isDarkMode");
  }

  static double getProportionateScreenWidth(double inputWidth) {
    return (inputWidth / DESIGN_WIDTH) * screenWidth;
  }

  static double getProportionateScreenHeight(double inputHeight) {
    return (inputHeight / DESIGN_HEIGHT) * screenHeight;
  }
}