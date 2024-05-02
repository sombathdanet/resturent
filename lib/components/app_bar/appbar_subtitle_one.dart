import 'package:flutter/material.dart';

import '../../themes/custom_text_style.dart';
import '../../themes/theme_helper.dart';

// ignore: must_be_immutable
class AppbarSubtitleOne extends StatelessWidget {
  AppbarSubtitleOne({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
    this.textOverflow = TextOverflow.ellipsis
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          overflow: textOverflow,
          style: CustomTextStyles.bodySmallPoppinsBlack900.copyWith(
            color: appTheme.gray800,
          ),
        ),
      ),
    );
  }
}
