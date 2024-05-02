import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:restaurant_app/routes/app_routes.dart';
import 'bindings/root_binding.dart';
import 'core/utils/size_utils.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.fade,
          title: 'Restaurant App',
          initialRoute: AppRoutes.initialRoute,
          getPages: AppRoutes.pages,
          initialBinding: RootBinding(),
        );
      },
    );
  }
}
