import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:restaurant_app/components/app_bar/appbar_title.dart';
import 'package:restaurant_app/components/app_bar/appbar_title_iconbutton.dart';
import 'package:restaurant_app/components/app_bar/custom_app_bar.dart';
import 'package:restaurant_app/components/custom_elevated_button.dart';
import 'package:restaurant_app/components/custom_field_view.dart';
import 'package:restaurant_app/components/custom_image_view.dart';
import 'package:restaurant_app/constants/image_constant.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';

import 'package:restaurant_app/themes/custom_button_style.dart';
import 'package:restaurant_app/themes/theme_helper.dart';

import '../../themes/custom_text_style.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          _buildColumn()
        ],
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar() {
  return CustomAppBar(
    height: 104.v,
    centerTitle: true,
    title: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24.h),
          child: Row(
            children: [
              AppbarTitleIconButton(
                  color: appTheme.blue300,
                  margin: EdgeInsets.only(top: 1.v, bottom: 3.v),
                  onTap: () {
                    onTapVector();
                  }),
              AppbarTitle(
                text: "Add Payment Detail".tr,
                margin: EdgeInsets.symmetric(
                  horizontal: 70.h
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    styleType: Style.bgFill,
  );
}

Widget _buildColumn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          "Card information",
          style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomFieldView(
          hintText: "0000",
          suffix: CustomImageView(
            margin: EdgeInsets.only(right: 10.h),
            imagePath: ImageConstant.masterCard,
            width: 30,
          ),
          autofocus: false,
        ),
      ),
      SizedBox(
        height: 10.v,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Padding(
             padding: EdgeInsets.only(left: 10.h,right: 5.h),
             child: CustomFieldView(
               width: 180.v,
               hintText: "MM/YY",
             ),
           ),
          Padding(
            padding: EdgeInsets.only(left: 5.h,right: 10.h),
            child: CustomFieldView(
              hintText: "CVC",
              width: 180.v,
            ),
          )
        ],
      ),
      SizedBox(height: 10.v),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          "Name on card",
          style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: CustomFieldView(
          hintText: "Full Name",
          autofocus: false,
        ),
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            "Country or region",
            style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          )),
      const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CustomFieldView(
            hintText: "Country",
            autofocus: false,
          )),
      SizedBox(height: 24.v),
      // ContainerButton(text: "Sign Up",onTap: (){},),
      CustomElevatedButton(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        text: 'Save Card',
        buttonTextStyle: const TextStyle(color: Colors.white),
        buttonStyle: CustomButtonStyles.fillOrange,
      ),
    ],
  );
}
void onTapVector(){
  Get.back();
}
