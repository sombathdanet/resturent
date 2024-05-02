import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

import '../../../themes/custom_text_style.dart';

void showErrorSnackBar({bool isError = true,String title = "ERROR",required String message}){
  Get.snackbar(
    "", "",
    titleText:  Text(
      title,
      style: theme.textTheme.bodySmall?.copyWith(
        fontSize: 20,
        color: Colors.white,
      ),
    ),
    messageText:  Text(
      message,
      style: theme.textTheme.bodySmall?.copyWith(
        height: 1.33,
        fontSize: 14,
        color: Colors.white,
      ),
    ),
    duration: const Duration(seconds: 1),
    //colorText: Color(0xFFFFC700),
  );
}
