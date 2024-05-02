import 'package:get/get.dart';
import 'package:restaurant_app/screens/search_screen/controller/search_controller.dart';
import '../screens/home_screen/controller/home_page_controller.dart';
import '../screens/home_screen/model/home_page_model.dart';
import '../screens/menu-screen/controller/menu_controller.dart';
import '../screens/menu-screen/model/menu_screen_model.dart';

class SearchBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(() => HomeController(Rx<HomePageModel>(HomePageModel()),Get.find(),Get.find()));
    Get.lazyPut(() => MenuScreenController(MenuScreenModel().obs,Get.find()));
    Get.put(SearchScreenController());
  }
}