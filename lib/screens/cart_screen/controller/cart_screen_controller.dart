import 'package:get/get.dart';
import 'package:restaurant_app/model/food_model/cart_model.dart';
import '../../../model/food_model/detail_food_model.dart';
import '../../../repository/cart_repo.dart';

class CartScreenController extends GetxController{
  CartRepo  cartRepo;
  CartScreenController({required this.cartRepo});
   Map<int,CartModel> _item = {};
  Map<int,CartModel> get item => _item;
  List<CartModel>? list =[];
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    getList();
  }
  void addToCart(int qty,DetailModel foodModel) {
    var totalAmount = 0.0;
    totalAmount = qty * foodModel.data!.price!.toDouble();
    if (qty > 0) {
      if (_item.containsKey(foodModel.data!.id!)) {
        _item.update(foodModel.data!.id!, (value) {
          return CartModel(
              id: foodModel.data!.id!,
              name: foodModel.data!.name!,
             imgUrl: foodModel.data!.foodImage!,
              qty: value.qty + qty,
              totalAmount: value.totalAmount!+totalAmount,
            detailModel: foodModel,
          );
        });
      } else {
        if (qty > 0) {
          _item.putIfAbsent(foodModel.data!.id!, () {
            return CartModel(
                id: foodModel.data!.id!,
                name: foodModel.data!.name!,
                imgUrl: foodModel.data!.foodImage!,
                qty: qty,
                totalAmount: totalAmount.toDouble(),
                detailModel: foodModel,
            );
          });
        }
      }
      cartRepo.putCarts(getCartList);
    }
    update();
  }
  void decrease(index){
      getCartList[index].qty --;
    if(getCartList[index].qty <= 0){
      _item.remove(getCartList[index].id);
    }
      cartRepo.putCarts(getCartList);
    update();
  }
  List<CartModel> get getCartList{
    return _item.entries.map((e) => e.value).toList();
  }
  void getList()async{
    getCartList;
    updateItem();
    list = await cartRepo.getList();
    setList = list!;
  }
  set setList(List<CartModel> cartList){
    update();
    list = cartList;
    for(int i =0;i<list!.length ;i++){
      _item.putIfAbsent(list![i].id!, () => list![i]);
    }
  }
  void clearCart(){
    cartRepo.clearCart();
    updateItem();
  }
  updateItem(){
    update();
    _item = {};
  }
   get getTotalAmount{
     var totalAmount = 0;
     for (var element in getCartList) {
       totalAmount = totalAmount + element!.totalAmount!.toInt();
     }
    return totalAmount;
  }
}