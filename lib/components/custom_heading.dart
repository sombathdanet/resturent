import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';

import '../constants/image_constant.dart';
import '../themes/custom_text_style.dart';
import '../themes/theme_helper.dart';
import 'custom_image_view.dart';

class CustomTitleHeading extends StatelessWidget {
  const CustomTitleHeading({
    Key? key,
    required this.text,
    this.textButton,
  }) : super(
          key: key,
        );
  final String text;
  final Widget? textButton;

  @override
  Widget build(BuildContext context) {
    return _buildTitle;
  }

  Widget get _buildTitle => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CustomImageView(
                    color: appTheme.orange800,
                    imagePath: ImageConstant.imgClose,
                    height: 40.v,
                    width: 43.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      // left: 8.h,
                      top: 5.v,
                    ),
                    child: Text(
                      text.tr,
                      style: CustomTextStyles.titleLargePoppinsGray900,
                    ),
                  ),
                ],
              ),
            ),
            textButton ?? const SizedBox.shrink(),
          ],
        ),
      );
}
