import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/screens/booking_table_screen/widgets/time_item.dart';

import '../../../components/custom_elevated_button.dart';
import '../../../components/custom_icon_button.dart';
import '../../../components/custom_image_view.dart';
import '../../../constants/image_constant.dart';
import 'model/time_item_model.dart';
import '../../../themes/app_decoration.dart';
import '../../../themes/custom_button_style.dart';
import '../../../themes/custom_text_style.dart';
import '../../../themes/theme_helper.dart';
import 'controller/book_table_controller.dart';

class BookTableBottomSheet extends StatelessWidget {
  BookTableBottomSheet({
    Key? key,
  }) : super(
          key: key,
        );

  final BookTableController bookTableController =
      Get.put(BookTableController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppBar(),
      body: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgBookTable,
          ),
          Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.h,
                      vertical: 10.v,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.v),
                        Padding(
                          padding: EdgeInsets.only(left: 102.h),
                          child: Text(
                            "Book a Table".tr,
                            style: CustomTextStyles.titleLargeBlack900,
                          ),
                        ),
                        SizedBox(height: 10.v),
                        _buildSelectTotalGuest(),
                        SizedBox(height: 21.v),
                        _buildPickTime(),
                        SizedBox(height: 10.v),
                        _buildPickDate(),
                        _buildButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSelectTotalGuest() {
    return Container(
      margin: EdgeInsets.only(right: 8.h),
      padding: EdgeInsets.all(7.h),
      decoration: AppDecoration.outlineOrange.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 9.v),
            child: Text(
              "Guests".tr,
              style: CustomTextStyles.bodyLargeBlack900,
            ),
          ),
          Container(
            width: 100.v,
            padding: EdgeInsets.symmetric(
              horizontal: 11.h,
              vertical: 6.v,
            ),
            decoration: AppDecoration.fillOrange.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  onTap: () {
                    bookTableController.decrementNumber();
                  },
                  decoration: const BoxDecoration(),
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  padding: EdgeInsets.all(1.h),
                  child: CustomImageView(
                    color: appTheme.whiteA700,
                    imagePath: ImageConstant.imgOutline24pxMinusCircle,
                  ),
                ),
                Obx(
                  () => Text(
                    "${bookTableController.guests.value}".tr,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(color: appTheme.whiteA700),
                  ),
                ),
                CustomIconButton(
                  onTap: () {
                    bookTableController.incrementNumber();
                  },
                  decoration: const BoxDecoration(),
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  child: CustomImageView(
                    color: appTheme.whiteA700,
                    imagePath: ImageConstant.imgOutline24pxPlusCircle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPickTime() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(5.h),
      decoration: AppDecoration.outlineOrange.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select Time".tr,
              style: CustomTextStyles.bodyLargeBlack900,
            ),
            SizedBox(height: 16.v),
            Wrap(
              runSpacing: 9.v,
              spacing: 9.h,
              children: List<Widget>.generate(
                bookTableController
                    .bookTableModelObj.value.timeItemList.value.length,
                (index) {
                  TimeItemModel model = bookTableController
                      .bookTableModelObj.value.timeItemList.value[index];
                  return TimeItemWidget(
                    model,
                  );
                },
              ),
            ),
            SizedBox(height: 9.v),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPickDate() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.outlineOrange.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => SizedBox(
              width: double.infinity,
              child: EasyDateTimeLine(
                initialDate:
                    bookTableController.selectedDatesFromCalendar1.value,
                locale: 'en_US',
                headerProps: const EasyHeaderProps(
                  // selectedDateFormat: SelectedDateFormat.fullDateDMY,
                  monthPickerType: MonthPickerType.dropDown,
                ),
                dayProps: EasyDayProps(
                  width: 50.h,
                  height: 70.v,
                ),
                onDateChange: (selectedDate) {
                  bookTableController.selectedDatesFromCalendar1.value =
                      selectedDate;
                },
                itemBuilder: (context, dayNumber, dayName, monthName, fullDate,
                    isSelected) {
                  return isSelected
                      ? Container(
                          width: 40.h,
                          decoration: BoxDecoration(
                            color: appTheme.orange800,
                            borderRadius: BorderRadius.circular(
                              12.h,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dayName.toString(),
                                style: CustomTextStyles.titleMediumWhiteA700
                                    .copyWith(
                                  color: appTheme.whiteA700,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.v),
                                child: Text(
                                  dayNumber.toString(),
                                  style: CustomTextStyles.titleMediumWhiteA700
                                      .copyWith(
                                    color: appTheme.whiteA700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          width: 55.h,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dayName.toString(),
                                style:
                                    CustomTextStyles.bodyLargeBlack900.copyWith(
                                  color: appTheme.black900,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.v),
                                child: Text(
                                  dayNumber.toString(),
                                  style: CustomTextStyles.bodyLargeBlack900
                                      .copyWith(
                                    color: appTheme.black900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 16.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomElevatedButton(
            width: 130.h,
            text: "Cancel".tr,
            rightIcon: Container(
              margin: EdgeInsets.only(left: 16.h),
              child: CustomImageView(
                color: appTheme.gray800,
                imagePath: ImageConstant.imgCloseGray800,
                height: 13.adaptSize,
                width: 13.adaptSize,
              ),
            ),
            buttonStyle: CustomButtonStyles.fillWhiteA,
            buttonTextStyle: CustomTextStyles.titleMediumBlack,
          ),
          CustomElevatedButton(
            width: 140.h,
            text: "Confirm".tr,
            rightIcon: Container(
              margin: EdgeInsets.only(left: 8.h),
              child: CustomImageView(
                color: appTheme.whiteA700,
                imagePath: ImageConstant.imgIcoutlinetablerestaurant,
                height: 16.adaptSize,
                width: 16.adaptSize,
              ),
            ),
            buttonStyle: CustomButtonStyles.fillOrange,
            buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
          ),
        ],
      ),
    );
  }
}

/// Navigates to the previous screen.
onTapVector() {
  Get.back();
}
