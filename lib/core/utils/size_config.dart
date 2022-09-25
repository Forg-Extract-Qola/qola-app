import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static double? screenHeightWithAppBar;
  static double? blockSizeVerticalWithAppBar;

  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeHorizontal;
  static double? safeVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  static double? safeHorizontalWithAppBar;
  static double? safeBlockVerticalWithAppBar;

  static double? appBarHeight = 70.0;
  static double? safePaddingTop;
  static double? safePaddingBottom;

  static double? safeVerticalTopOnly;
  static double? safeVerticalBottomOnly;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
    safePaddingTop = _mediaQueryData!.padding.top;
    safePaddingBottom = _mediaQueryData!.padding.bottom;

    _safeAreaHorizontal = _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical = safePaddingTop! + safePaddingBottom!;
    safeHorizontal =  (screenWidth! - _safeAreaHorizontal!);
    safeVertical =  (screenHeight! - _safeAreaVertical!);
    safeVerticalTopOnly =  (screenHeight! - safePaddingTop!);
    safeVerticalBottomOnly =  (screenHeight! - safePaddingBottom!);

    safeBlockHorizontal = safeHorizontal! / 100;
    safeBlockVertical = safeVertical! / 100;

    screenHeightWithAppBar = screenHeight! - appBarHeight! - safePaddingTop!;
    blockSizeVerticalWithAppBar = screenHeightWithAppBar! / 100;
    safeHorizontalWithAppBar = safeVertical! - appBarHeight! - safePaddingTop!;
    safeBlockVerticalWithAppBar = safeHorizontalWithAppBar! / 100;
  }
}