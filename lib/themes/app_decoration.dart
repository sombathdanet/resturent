import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue50,
      );

  static BoxDecoration get fillBlue300 => BoxDecoration(
        color: appTheme.blue300,
      );

  static BoxDecoration get fillDeepBlue => BoxDecoration(
        color: appTheme.deepBlue.withOpacity(0.6),
      );

  static BoxDecoration get fillOrange => BoxDecoration(
        color: appTheme.orange80001,
      );

  static BoxShadow get boxShadow => BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        blurRadius: 7,
        offset: const Offset(0, 3),
      );

  static BoxDecoration get fillDeepPurple => BoxDecoration(
        color: appTheme.deepPurple100,
      );

  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray5001,
      );

  static BoxDecoration get fillGreen => BoxDecoration(
        color: appTheme.green50,
      );

  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Gradient decorations
  static BoxDecoration get gradientOrangeToPink => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.83, 0.5),
          end: const Alignment(-0.02, 0.53),
          colors: [
            appTheme.orange80001.withOpacity(0.23),
            appTheme.pink500,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => const BoxDecoration();

  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: appTheme.orange80001,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      );

  static BoxDecoration get outlineOrange => BoxDecoration(
        border: Border.all(
          color: appTheme.orange80001.withOpacity(0.4),
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder44 => BorderRadius.circular(
        44.h,
      );

  // Custom borders
  static BorderRadius get customBorderTL15 => BorderRadius.vertical(
        top: Radius.circular(15.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );

  static BorderRadius get roundedBorder15 => BorderRadius.circular(
        15.h,
      );

  static BorderRadius get roundedOnlyTopBorder15 => const BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      );

  static BorderRadius get roundedOnlyBottomBorder15 => const BorderRadius.only(
        bottomLeft: Radius.circular(15.0),
        bottomRight: Radius.circular(15.0),
      );

  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
