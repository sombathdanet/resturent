import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );

  static get bodySmallGray500 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray500,
      );

  static get bodySmallPoppinsBlack900 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.black900,
      );

  static get bodySmallPoppinsBlack900Light =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w300,
      );

  static get bodySmallPoppinsBlack900Light_1 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.black900.withOpacity(0.5),
        fontWeight: FontWeight.w300,
      );

  // Display style
  static get displayMedium_1 => theme.textTheme.displayMedium!;

  // Headline text style
  static get headlineMediumBlack900 => theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.black900.withOpacity(0.8),
        fontWeight: FontWeight.w400,
      );

  // Label text style
  static get labelLargeBlack900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
      );

  static get labelLargeBlue300 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blue300,
        fontWeight: FontWeight.w800,
      );

  static get labelLargeBlueGray100ab => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray100Ab,
      );

  static get labelLargeGreen500 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.green500,
        fontWeight: FontWeight.w800,
      );

  // Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );

  static get titleLargeGrey800 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray800,
      );

  static get titleLargeBlack900ExtraBold =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w800,
      );

  static get titleLargePoppinsGray900 =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: appTheme.gray900,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w600,
      );

  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );

  static get titleMediumBlack => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w900,
      );

  static get titleMediumExtraBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w800,
      );

  static get titleMediumGray800 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray800.withOpacity(0.67),
        fontWeight: FontWeight.w800,
      );

  static get titleMediumGray800ExtraBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w800,
      );

  static get titleMediumOrange80001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.orange80001,
      );

  static get titleMediumRobotoBlack900 =>
      theme.textTheme.titleMedium!.roboto.copyWith(
        color: appTheme.black900.withOpacity(0.65),
      );

  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );

  static get titleSmallGray500 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray500,
      );
}

extension on TextStyle {
  TextStyle get lato {
    return copyWith(
      fontFamily: 'Lato',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}
