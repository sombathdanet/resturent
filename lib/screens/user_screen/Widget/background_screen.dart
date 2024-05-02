import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/components/custom_image_view.dart';

import '../../../../constants/image_constant.dart';

class BackGroundScreen extends StatelessWidget {
  const BackGroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      color: const Color(0xFFF56606).withOpacity(0.1),
      height: double.infinity,
      width: double.infinity,
      imagePath: ImageConstant.imgAirplane,
    );
  }
}
