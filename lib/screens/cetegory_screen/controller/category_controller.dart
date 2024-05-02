import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/category_model.dart';

class CategoryController extends GetxController {
  CategoryController(this.categoryModelObj);
  Rx<CategoryModel> categoryModelObj;
}
