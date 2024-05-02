import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:restaurant_app/screens/home_screen/model/popular_category.dart';
import 'package:restaurant_app/screens/home_screen/model/product_item_model.dart';

import '../../../../constants/image_constant.dart';

class HomePageModel {
  Rx<List<PopularCategoryItemModel>> popularCategoryItemList = Rx(
    [
      PopularCategoryItemModel(
        image: ImageConstant.imgAtikahAkhtarD.obs,
        categoryName: "Biryani".obs,
      ),
      PopularCategoryItemModel(
        image: ImageConstant.imgAtikahAkhtarD.obs,
        categoryName: "Biryani".obs,
      ),
      PopularCategoryItemModel(
        image: ImageConstant.imgAtikahAkhtarD.obs,
        categoryName: "Biryani".obs,
      ),
      PopularCategoryItemModel(
        image: ImageConstant.imgAtikahAkhtarD.obs,
        categoryName: "Biryani".obs,
      ),
    ],
  );

  Rx<List<ProductItemModel>> specialProductItemList = Rx(
    [
      ProductItemModel(
        image: ImageConstant.imgMuttonLambBir.obs,
        productName: "Hyderabadi Biryani".obs,
        currentPrice: "299".obs,
        previousPrice: "399".obs,
        offer: "20% OFF".obs,
        productDescription:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint."
                .obs,
        reviewScore: "5.0".obs,
        numberOfReviews: "(34)".obs,
        category: "Main Course".obs,
        smallPill: "Chef Pick".obs,
      ),
      ProductItemModel(
        image: ImageConstant.imgMuttonLambBir.obs,
        productName: "Hyderabadi Biryani".obs,
        currentPrice: "299".obs,
        previousPrice: "399".obs,
        offer: "20% OFF".obs,
        productDescription:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint."
                .obs,
        reviewScore: "5.0".obs,
        numberOfReviews: "(34)".obs,
        category: "Main Course".obs,
        smallPill: "Chef Pick".obs,
      ),
    ],
  );
  Rx<List<ProductItemModel>> deliciousDessertItemList = Rx(
    [
      ProductItemModel(
        image: ImageConstant.imgMuttonLambBir.obs,
        productName: "delicious food".obs,
        currentPrice: "299".obs,
        previousPrice: "399".obs,
        offer: "20% OFF".obs,
        productDescription:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint."
                .obs,
        reviewScore: "5.0".obs,
        numberOfReviews: "(34)".obs,
        category: "Main Course".obs,
        smallPill: "Chef Pick".obs,
      ),
      ProductItemModel(
        image: ImageConstant.imgMuttonLambBir.obs,
        productName: "Hyderabadi Biryani".obs,
        currentPrice: "299".obs,
        previousPrice: "399".obs,
        offer: "20% OFF".obs,
        productDescription:
            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint."
                .obs,
        reviewScore: "5.0".obs,
        numberOfReviews: "(34)".obs,
        category: "Main Course".obs,
        smallPill: "Chef Pick".obs,
      ),
    ],
  );
}
