import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/custom_text_style.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.onPressed,
    this.text,
    this.style,
  }) : super(
          key: key,
        );

  final VoidCallback? onPressed;
  final String? text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return buildTextButton;
  }

  Widget get buildTextButton => TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text ?? "See All".tr,
              style: style ??
                  CustomTextStyles.titleMediumRobotoBlack900.copyWith(
                    decoration: TextDecoration.underline,
                    fontSize: 14.0,
                  ),
            ),
          ],
        ),
      );
}
