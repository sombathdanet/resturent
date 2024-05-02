import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

import '../custom_image_view.dart';

// ignore: must_be_immutable
class AppbarTitleImage extends StatelessWidget {
  AppbarTitleImage({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;


  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: CustomImageView(
        color: appTheme.gray500,
        imagePath: imagePath,
        height: 24.v,
        width: 17.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
