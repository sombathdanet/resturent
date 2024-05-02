import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/screens/checkout_screen/controller/checkout_screen_controller.dart';
import 'package:restaurant_app/screens/checkout_screen/list_card_master/list_card_master.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../components/app_bar/appbar_title.dart';
import '../../../components/app_bar/appbar_title_iconbutton.dart';
import '../../../components/app_bar/custom_app_bar.dart';
import '../../../components/custom_elevated_button.dart';
import '../../../components/custom_field_view.dart';
import '../../../constants/image_constant.dart';
import '../../../themes/app_decoration.dart';
import '../../../themes/custom_button_style.dart';
import '../../../themes/custom_text_style.dart';
import '../../../themes/theme_helper.dart';
import '../../routes/app_routes.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key,});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final PageController _controller = PageController();
  PrimaryColors colors = PrimaryColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: SizedBox(child: _buildBottom()),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildPaymentText(),
        _buildPaymentCard(),
        _buildIndicator(),
        _buildAddressDetail(),
        _buildPromoCode(),
        _buildTotal(),
      ],
    );
  }

  Widget _buildPaymentCard() {
    return SizedBox(
      height: 240.v,
      child: PageView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemCount: listMaster.length,
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusStyle.roundedBorder15,
              image: DecorationImage(
                image: AssetImage(listMaster[index].image),
                fit: BoxFit.cover,
              )
            ),
          );
        },
      ),
    );
  }

  Widget _buildPaymentText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Text(
            "PAYMENT METHOD",
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 14.0.h,
            ),
          ),
        ),
        buildTextButton
      ],
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 14.h),
          child: Text(
            "ADDRESS",
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 14.0.h,
            ),
          ),
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: listMaster.length,
          axisDirection: Axis.horizontal,
          effect: ExpandingDotsEffect(
          activeDotColor: Colors.deepPurpleAccent.withOpacity(0.5),
          radius: 10,
          spacing: 10,
          dotHeight:6,
          dotWidth:6,
        )),
        buildTextButton
      ],
    );
  }

  Widget _buildAddressDetail() {
    return Container(
      width: double.infinity,
      height: 120.v,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "John Doe",
            style: CustomTextStyles.titleLargeBlack900.copyWith(
              fontSize: 18.0.adaptSize,
            ),
          ),
          Text(
            "101,Arjun Nagar",
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 14.0.adaptSize,
            ),
          ),
          Text(
            "Delhi",
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 14.0.adaptSize,
            ),
          ),
          Text(
            "110029, India",
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 14.0.adaptSize,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCode() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.h, vertical: 20.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildContainerTextField(),
          _buildApplyButton(),
        ],
      ),
    );
  }

  Widget _buildContainerTextField() {
    return Container(
        margin:   EdgeInsets.only(left: 8.h,right: 8.h),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        width: 220.h,
        child:  const CustomFieldView(
          hintText: "Promo Code",
        ));
  }

  Widget _buildApplyButton() {
    return Container(
      margin:   EdgeInsets.only(left: 8.h,right: 8.h),
      width: 100.h,
      child: CustomElevatedButton(
        height: 50.h,
        onPressed: () {
          Get.toNamed(AppRoutes.otpScreen);
        },
        text: 'Apply',
        buttonTextStyle: const TextStyle(color: Colors.white),
        buttonStyle: CustomButtonStyles.fillOrange,
      ),
    );
  }

  Widget _buildTotal() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 14.h),
              child: Text(
                "DELIVERY",
                style: CustomTextStyles.titleMediumRobotoBlack900.copyWith(
                  fontSize: 14.0.adaptSize,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right: 14.h),
              child: Text(
                "Free",
                style: CustomTextStyles.titleMediumRobotoBlack900.copyWith(
                  fontSize: 16.0.adaptSize,
                ),
              ),
            ),
          ],
        ),
         SizedBox(
          height: 10.v,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 14.h),
              child: Text(
                "TOTAL",
                style: CustomTextStyles.titleMediumRobotoBlack900.copyWith(
                  fontSize: 16.0.adaptSize,
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(right: 14.h),
              child: Text(
                "\$999",
                style: CustomTextStyles.headlineMediumBlack900.copyWith(
                  fontSize: 16.0.adaptSize,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget get buildTextButton => TextButton(
        onPressed: () {},
        child: Text(
          "EDIT".tr,
          style: CustomTextStyles.titleMediumRobotoBlack900.copyWith(
            decoration: TextDecoration.underline,
            fontSize: 14.0.fSize,
          ),
        ),
      );
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 80.v,
      centerTitle: true,
      title: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.h,),
            child: Row(
              children: [
                AppbarTitleIconButton(
                    color: appTheme.blue300,
                    imagePath: ImageConstant.imgVectorWhiteA700,
                    margin: EdgeInsets.only(top: 1.v, bottom: 3.v),
                    onTap: () {
                      onTapVector();
                    }),
                AppbarTitle(
                  text: "Checkout".tr,
                  margin:  EdgeInsets.symmetric(horizontal: 110.h),
                ),
              ],
            ),
          ),
        ],
      ),
      styleType: Style.bgFill,
    );
  }

  Widget _buildBottom() {
    final index = Get.arguments['tableID'];
    final CheckOutController checkOutController = Get.find();
    return CustomElevatedButton(
      onPressed: (){
        checkOutController.payNow(index);
      },
      margin:  EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
      text: 'Pay now',
      buttonTextStyle: const TextStyle(color: Colors.white),
      buttonStyle: CustomButtonStyles.fillOrange,
    );
  }

  void onTapVector() {
    Get.back();
  }
}
