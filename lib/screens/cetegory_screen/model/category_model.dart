import 'package:get/get_rx/src/rx_types/rx_types.dart';


import '../../../../constants/image_constant.dart';
import 'trending_model.dart';
import 'all_category_model.dart';
import 'most_popular_model.dart';

class CategoryModel {
  Rx<List<MostPopularItemModel>> mostPopularItemList = Rx(
    [
      MostPopularItemModel(
        image: ImageConstant.imgAtikahAkhtarD.obs,
        categoryName: "Biryani".obs,
      ),
      MostPopularItemModel(
        image: ImageConstant.imgAtikahAkhtarD.obs,
        categoryName: "Biryani".obs,
      ),
      MostPopularItemModel(
        image: ImageConstant.imgAtikahAkhtarD.obs,
        categoryName: "Biryani".obs,
      ),
      MostPopularItemModel(
        image: ImageConstant.imgAtikahAkhtarD.obs,
        categoryName: "Biryani".obs,
      ),
    ],
  );
  Rx<List<AllCategoryItemModel>> allCategoryItemList = Rx(
    [
      AllCategoryItemModel(
        categoryName: "Biryani Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ), AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ), AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ), AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ), AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ), AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
      AllCategoryItemModel(
        categoryName: "Biryani".obs,
      ),
    ],
  );

  Rx<List<TrendingItemModel>> trendingItemList = Rx(
    [
      TrendingItemModel(
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
      TrendingItemModel(
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
