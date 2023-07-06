import 'package:flutter/material.dart';
import 'package:flutter_ws_1/src/constants/colors.dart';
import 'package:flutter_ws_1/src/constants/sizes.dart';

class TElevatedButtonTheme {
TElevatedButtonTheme._();


// Light Theme

static final lightElevatedButtonTheme = ElevatedButtonThemeData(
style: ElevatedButton.styleFrom(
  elevation: 2,
  shape:  const RoundedRectangleBorder(),
  foregroundColor: tWhiteColor,
  backgroundColor: tSecondaryColor,
  side:  const BorderSide(color:tSecondaryColor),
  padding:  const EdgeInsets.symmetric(vertical: tButtonHeight)
)
);

// Dark Theme
static final darkElevatedButtonTheme = ElevatedButtonThemeData(
style: ElevatedButton.styleFrom(
  elevation: 2,
  shape:  const RoundedRectangleBorder(),
  foregroundColor: tSecondaryColor,
  backgroundColor: tWhiteColor,
  side:  const BorderSide(color:tSecondaryColor),
  padding:  const EdgeInsets.symmetric(vertical: tButtonHeight)
)
);
}