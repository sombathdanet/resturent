import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';

import '../model/time_item_model.dart';
import '../../../../themes/theme_helper.dart';
import 'package:flutter/material.dart';

class TimeItemWidget extends StatelessWidget {
  const TimeItemWidget(
    this.timeItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  final TimeItemModel timeItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Theme(
        data: ThemeData(
          canvasColor: Colors.transparent,
        ),
        child: RawChip(
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 8.v,
          ),
          showCheckmark: false,
          labelPadding: EdgeInsets.zero,
          label: Text(
            timeItemModelObj.time!.value,
            style: TextStyle(
              color: (timeItemModelObj.isSelected?.value ?? false)
                  ? appTheme.whiteA700
                  : appTheme.orange80001,
              fontSize: 16.fSize,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
            ),
          ),
          selected: (timeItemModelObj.isSelected?.value ?? false),
          backgroundColor: Colors.transparent,
          selectedColor: appTheme.orange80001,
          shape: (timeItemModelObj.isSelected?.value ?? false)
              ? RoundedRectangleBorder(
                  side: BorderSide(
                    color: appTheme.orange80001,
                    width: 1.h,
                  ),
                  borderRadius: BorderRadius.circular(
                    5.h,
                  ),
                )
              : RoundedRectangleBorder(
                  side: BorderSide(
                    color: appTheme.orange80001,
                    width: 1.h,
                  ),
                  borderRadius: BorderRadius.circular(
                    5.h,
                  ),
                ),
          onSelected: (value) {
            timeItemModelObj.isSelected!.value = value;
          },
        ),
      ),
    );
  }
}
