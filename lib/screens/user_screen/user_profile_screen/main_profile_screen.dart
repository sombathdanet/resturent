import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/components/custom_image_view.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/model/user_model/user_profile_model.dart';
import '../../../../components/custom_elevated_button.dart';
import '../../../../constants/image_constant.dart';
import '../../../../themes/app_decoration.dart';
import '../../../../themes/custom_button_style.dart';
import '../../../../themes/custom_text_style.dart';
import '../../../../themes/theme_helper.dart';
import '../../../routes/app_routes.dart';
import '../Widget/background_profile.dart';
import 'controller/main_profile_controller.dart';

class MainProfileScreen extends StatefulWidget {
  const MainProfileScreen({super.key});

  @override
  State<MainProfileScreen> createState() => _MainProfileScreenState();
}

class _MainProfileScreenState extends State<MainProfileScreen> {
  PrimaryColors colors = PrimaryColors();
  MainProfileController mainProfileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body:Obx(()=> mainProfileController.isLoading.value?_buildMainBody():const Center(child: CircularProgressIndicator())),
    );
  }
  Widget _buildMainBody(){
    return Stack(
      children: [
        const BackGroundProfile(),
        Container(
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.h),topRight: Radius.circular(20.h)),
          ),
          child: Column(
            children: [
              _buildProfileAndName(),
              _buildDescription(),
              CustomElevatedButton(
                onPressed: (){
                  Get.toNamed(AppRoutes.editProfileScreen);
                },
                leftIcon: CustomImageView(
                  imagePath: ImageConstant.pencil,
                  width: 15.h,
                  color: Colors.white,
                ),
                margin:  EdgeInsets.symmetric(horizontal: 100.h, vertical: 20.v),
                text: '  Edit my profile',
                buttonTextStyle: const TextStyle(color: Colors.white),
                buttonStyle: CustomButtonStyles.fillOrange,
              ),
              _buildAddInterest(),
              // _buildHasInterest(),
              Padding(
                padding:  EdgeInsets.only(top: 20.v),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap:(){
                        Get.toNamed(AppRoutes.paymentScreen);
              },
                      child: _buildSmallContainer(
                          icon: ImageConstant.cardIcon, label: "Add card"),
                    ),
                    InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.contactUsScreen);
                      },
                      child: _buildSmallContainer(
                          icon: ImageConstant.contactusIcon, label: "Contact us"),
                    ),
                    InkWell(
                      onTap: (){
                        mainProfileController.logout();
                      },
                      child: _buildSmallContainer(
                          icon: ImageConstant.logoutIcon, label: "Log out"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildProfileAndName() {
    return Padding(
        padding:  EdgeInsets.only(top: 10.h),
        child: Column(
          children: [
            CircleAvatar(
              radius: 45.v,
              backgroundImage: NetworkImage(mainProfileController.userProfile.value!.data!.avatar.toString()),
            ),
            Text(
              mainProfileController.userProfile.value!.data!.name.toString(),
              style:
                  theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
  }

  Widget _buildDescription() {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 20.h),
      child: Text(
        "Amet minim mollit non deserunt ullamco estsit aliqua dolor do amet sint.Verlit officia.",
        style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }
  Widget _buildAddInterest() {
    return Container(
      height: 300.v,
      margin:  EdgeInsets.symmetric(horizontal: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusStyle.roundedBorder15,
        boxShadow: [AppDecoration.boxShadow],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusStyle.roundedOnlyTopBorder15,
                  color: Colors.red,
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://i.pinimg.com/564x/10/df/8e/10df8e38ad52aad0cddbbc57ba15accb.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusStyle.roundedOnlyBottomBorder15,
              ),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 2.v),
                    child: Text(
                      "Tell us what interests with you!",
                      style: theme.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "You don't have any interests listed. Tell us what you love the most and we'll recommend relevant products to you.",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
                    ),
                  ),
                  CustomElevatedButton(
                    margin:  EdgeInsets.symmetric(
                        horizontal: 30.h, vertical: 10.v),
                    text: 'Add my interests',
                    buttonTextStyle: const TextStyle(color: Colors.white),
                    buttonStyle: CustomButtonStyles.fillOrange,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallContainer({
    required String icon,
    required String label,
  }) {
    return Container(
      height: 90.v,
      width: 90.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusStyle.roundedBorder15,
        boxShadow: [AppDecoration.boxShadow ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: icon,
            color: colors.orange80001,
            width: 30.h,
          ),
          SizedBox(
            height: 5.v,
          ),
          Text(
            label,
            style: theme.textTheme.titleMedium
                ?.copyWith(fontSize: 12.v, fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }

  Widget _buildInterest() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "MY INTEREST",
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 14.0.v,
          ),
        ),
        buildTextButton
      ],
    );
  }

  Widget get buildTextButton => TextButton(
        onPressed: () {},
        child: Text(
          "EDIT".tr,
          style: CustomTextStyles.titleMediumRobotoBlack900.copyWith(
            decoration: TextDecoration.underline,
            fontSize: 14.0.v,
          ),
        ),
      );
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      toolbarHeight: 80.v,
      centerTitle: true,
      leading: Padding(
        padding:  EdgeInsets.only(top: 5.v),
          child:  IconButton(
            onPressed: (){
              onTapVector();
            },
          icon:   Icon(Icons.arrow_back_ios,color: Colors.white,size: 16.h,)
          )),
      backgroundColor: Colors.deepPurple.withOpacity(0.7),
      title: Padding(
        padding:  EdgeInsets.only(top: 5.v),
        child: Text(
          "Profile",
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 14.v,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  onTapVector() {
    Get.back();
  }
}
