import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

import '../../constants/image_constant.dart';
import '../custom_icon_button.dart';
import '../custom_image_view.dart';

// ignore: must_be_immutable
class AppbarTitleIconButton extends StatelessWidget {
  AppbarTitleIconButton({
    Key? key,
    this.imagePath,
    this.color,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;
  Color? color;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomIconButton(
          color: color,
          height: 20.adaptSize,
          width: 20.adaptSize,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CustomImageView(
              color: appTheme.whiteA700,
              imagePath: ImageConstant.imgVectorWhiteA700,
            ),
          ),
        ),
      ),
    );
  }
}
