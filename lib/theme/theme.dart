import 'package:flutter/material.dart';
import 'package:qola_app/theme/colors.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: backgroundColor,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.accent,
      colorScheme: Theme.of(context).colorScheme.copyWith(secondary: Colors.white)
    ),
    textTheme: TextTheme(
      displayLarge: genericTextStyle(fontSize: 57.0),
      displayMedium: genericTextStyle(fontSize: 45.0),
      displaySmall: genericTextStyle(fontSize: 36.0),
      headlineLarge: genericTextStyle(fontSize: 32.0),
      headlineMedium: genericTextStyle(fontSize: 28.0),
      headlineSmall: genericTextStyle(fontSize: 24.0),
      titleLarge: genericTextStyle(fontSize: 22.0),
      titleMedium: genericTextStyle(fontSize: 16.0),
      titleSmall: genericTextStyle(fontSize: 14.0),
      labelLarge: genericTextStyle(fontSize: 14.0),
      labelMedium: genericTextStyle(fontSize: 12.0),
      labelSmall: genericTextStyle(fontSize: 11.0),
      bodyLarge: genericTextStyle(fontSize: 16.0),
      bodyMedium: genericTextStyle(fontSize: 14.0),
      bodySmall: genericTextStyle(fontSize: 12.0)
    ),
    primaryTextTheme: TextTheme(
      displayLarge: genericTextStyle(fontSize: 57.0),
      displayMedium: genericTextStyle(fontSize: 45.0),
      displaySmall: genericTextStyle(fontSize: 36.0),
      headlineLarge: genericTextStyle(fontSize: 32.0),
      headlineMedium: genericTextStyle(fontSize: 28.0),
      headlineSmall: genericTextStyle(fontSize: 24.0),
      titleLarge: genericTextStyle(fontSize: 22.0),
      titleMedium: genericTextStyle(fontSize: 16.0),
      titleSmall: genericTextStyle(fontSize: 14.0),
      labelLarge: genericTextStyle(fontSize: 14.0),
      labelMedium: genericTextStyle(fontSize: 12.0),
      labelSmall: genericTextStyle(fontSize: 11.0),
      bodyLarge: genericTextStyle(fontSize: 16.0),
      bodyMedium: genericTextStyle(fontSize: 14.0),
      bodySmall: genericTextStyle(fontSize: 12.0)
    )
  );
}

TextStyle genericTextStyle({
  Color color = textColor,
  double fontSize = 15.0,
  FontWeight fontWeight = FontWeight.normal
}) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: 'DM_Sans'
  );
}

TextStyle buttonTextStyle({
  Color color = Colors.white,
  double fontSize = 15.0,
  FontWeight fontWeight = FontWeight.normal
}) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: 'DM_Sans'
  );
}

TextStyle linkTextStyle({
  Color color = Colors.white,
  double fontSize = 15.0,
  FontWeight fontWeight = FontWeight.normal
}) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: 'DM_Sans',
      decoration: TextDecoration.underline
  );
}