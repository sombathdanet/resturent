
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/extension/groupby.dart';
import 'package:restaurant_app/model/food_model/detail_food_model.dart';
import 'package:restaurant_app/model/food_model/popular_food_model.dart';
import 'package:restaurant_app/screens/cart_screen/controller/cart_screen_controller.dart';
import 'package:restaurant_app/screens/detail_screen/detail_screen_controller.dart';
import 'package:restaurant_app/screens/favorite-screen/controller/favorite_controller.dart';
import 'package:restaurant_app/screens/home_screen/controller/home_page_controller.dart';
import '../../../model/food_model/food_category_model.dart';
import '../../../repository/food_repo.dart';
import '../model/menu_screen_model.dart';

class MenuScreenController extends GetxController{
  FoodRepo foodRepo;
  MenuScreenController(this.menuModelObj,this.foodRepo);
  Rx<MenuScreenModel> menuModelObj;
  RxList<DataPopular> dataCategory = RxList.empty(growable: true);
  RxList<DataCategory> listCategoryFood = RxList.empty(growable: true);
  final nameOfCategory = <dynamic>[].obs;
  RxList<DataPopular> listOfCategory = RxList.empty(growable: true);
  RxList<DataPopular> newListCategory  = RxList.empty(growable: true);
  List<DataPopular> favoriteList = [];
  Rx<bool> isLoadings = false.obs;
  Rx<bool> isLoading = false.obs;
  @override
  void onInit()async{
    super.onInit();
    getCategoryData();
    getCategory();
    getListFav();
    getList();
    loadStateFromStorage();
  }
  getCategoryData()async{
    try{
      final res = await foodRepo.getFoodByFilter("categories");
      if(res.status == 200){
        dataCategory(res.data);
        final items = res.data?.groupBy((element) =>element.foodCategoryEntity?.name);
        for (var element in items!.entries) {
          nameOfCategory.add(element.key);
          listOfCategory.addAll(element.value);
          filterItemByIndex();
        }
      }
      if(nameOfCategory.isNotEmpty && listOfCategory.isNotEmpty){
        isLoading.value = true;
      }
    }on DioException catch(e){
      throw e.message!;
    }
  }
  void filterItemByIndex( {int? index = 0}){
    newListCategory.clear();
    newListCategory.addAll(listOfCategory.where((e) => e.foodCategoryEntity!.name == nameOfCategory[index!]));
  }
  void getCategory()async{
    try{
      final res = await foodRepo.getDataFromCategory();
      listCategoryFood(res);
      isLoadings(true);
    }on DioException catch(e){
      throw e.message!;
    }
  }

  getListFav()async{
    final list = await foodRepo.getFavList();
    favoriteList = list!;
  }

  Map<int,DataPopular> itemFav = {};

  void addToFavorite(DataPopular foodModel) {
    updateItem();
    if(itemFav.containsKey(foodModel.id)){
      itemFav.remove(foodModel.id);
      listSearch = List.from(itemFav.entries.map((e) => e.value).toList());
    }else{
      itemFav.putIfAbsent(foodModel.id!, () => foodModel);
      listSearch = List.from(itemFav.entries.map((e) => e.value).toList());
    }
    foodRepo.putFavList(getListDataPopular);
  }

  List<DataPopular> get getListDataPopular{
    return itemFav.entries.map((e) => e.value).toList();
  }

  bool isFav(DataPopular foodModel)  {
    if(itemFav.containsKey(foodModel.id)){
      return true;
    }
    return false;
  }

  void getList()async{
    getListDataPopular;
    updateItem();
    favoriteList = (await foodRepo.getFavList())!;
    setList = favoriteList;
  }

  set setList(List<DataPopular> cartList){
     updateItem();
      favoriteList = cartList;

    for(int i =0;i<favoriteList.length ;i++){
      itemFav.putIfAbsent(favoriteList[i].id!, () => favoriteList[i]);
      listSearch.clear();
      listSearch.addAll(favoriteList);
    }
  }

  void updateItem(){
    update();
  }
  final GetStorage storage = GetStorage();

  final RxInt selectedIndex = 0.obs;

  void setSelectedIndex(int index) => selectedIndex.value = index;

  Future<void> loadStateFromStorage() async {
    selectedIndex.value = storage.read('selectedIndex') ?? 0;
  }

  Future<void> saveStateToStorage() async {
    storage.write('selectedIndex', selectedIndex.value);
  }

   CartScreenController cartScreenController = Get.find();
  addToCart(DataPopular dataPopular) {
    final list = coverToDetail(dataPopular);
    cartScreenController.addToCart(dataPopular.qty, list);
  }
  DetailModel coverToDetail(DataPopular dataPopular){
    DetailModel detailModel = DetailModel(
      status: null,
      message: "",
        messageKey: "",
      data: dataPopular,
    );
    return detailModel;
  }
  List<DataPopular> listSearch = [];
  void search(String value){
    update();
    listSearch = itemFav.entries.map((e) => e.value).toList().where((element) => element.name!.toLowerCase().contains(value.toLowerCase())).toList();
  }
}
