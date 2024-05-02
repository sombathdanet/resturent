import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/utils/size_utils.dart';
import 'package:restaurant_app/screens/home_screen/controller/home_page_controller.dart';
import 'package:restaurant_app/screens/menu-screen/controller/menu_controller.dart';
import 'package:restaurant_app/themes/app_decoration.dart';
import '../constants/image_constant.dart';
import '../screens/menu-screen/widgets/dessert.dart';
import '../screens/menu-screen/widgets/drink.dart';
import '../screens/menu-screen/widgets/fast_food.dart';
import '../screens/menu-screen/widgets/fish.dart';
import '../themes/custom_text_style.dart';
import '../themes/theme_helper.dart';
import 'custom_image_view.dart';

class CustomTabBar extends StatefulWidget {
  final void Function(TabBarEnum)? onChanged;
  const CustomTabBar({Key? key, this.onChanged}) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with TickerProviderStateMixin{
  late TabController _tabController;
  final MenuScreenController controller = Get.find();
  @override
  void initState() {
    super.initState();
    _initializeTabController();
    //   _listenToCategoryChanges();
  }

  void _initializeTabController() {
    _tabController = TabController(
      length: controller.nameOfCategory.length,
      vsync: this,
    );
    _tabController.addListener(() {
      controller.filterItemByIndex(index: _tabController.index);
      controller.selectedIndex.value = _tabController.index;
    });
  }

  // void _listenToCategoryChanges() {
  //   ever(controller.nameOfCategory, (_) {
  //     _tabController.dispose(); // Dispose old controller
  //     _initializeTabController(); // Initialize new controller
  //   });
  // }
  final List<TabBarMenuModel> tabBarMenuList = [
    TabBarMenuModel(
      icon: ImageConstant.imgBurger,
      activeIcon: ImageConstant.imgBurger,
      title: "FAST FOOD".tr,
      type: TabBarEnum.fastFood,
    ),
    TabBarMenuModel(
      icon: ImageConstant.imgFish,
      activeIcon: ImageConstant.imgFish,
      title: "FISH".tr,
      type: TabBarEnum.fish,
    ),
    TabBarMenuModel(
      icon: ImageConstant.imgDessert,
      activeIcon: ImageConstant.imgDessert,
      title: "DESSERT".tr,
      type: TabBarEnum.dessert,
    ),
    TabBarMenuModel(
      icon: ImageConstant.imgDrink,
      activeIcon: ImageConstant.imgDrink,
      title: "DRINK".tr,
      type: TabBarEnum.drink,
    ),
    TabBarMenuModel(
      icon: ImageConstant.imgBurger,
      activeIcon: ImageConstant.imgBurger,
      title: "FAST FOOD".tr,
      type: TabBarEnum.fastFood,
    ),
    TabBarMenuModel(
      icon: ImageConstant.imgFish,
      activeIcon: ImageConstant.imgFish,
      title: "FISH".tr,
      type: TabBarEnum.fish,
    ),
    TabBarMenuModel(
      icon: ImageConstant.imgDessert,
      activeIcon: ImageConstant.imgDessert,
      title: "DESSERT".tr,
      type: TabBarEnum.dessert,
    ),
    TabBarMenuModel(
      icon: ImageConstant.imgDrink,
      activeIcon: ImageConstant.imgDrink,
      title: "DRINK".tr,
      type: TabBarEnum.drink,
    ),
    TabBarMenuModel(
      icon: ImageConstant.imgDrink,
      activeIcon: ImageConstant.imgDrink,
      title: "DRINK".tr,
      type: TabBarEnum.drink,
    ),
    TabBarMenuModel(
      icon: ImageConstant.imgDrink,
      activeIcon: ImageConstant.imgDrink,
      title: "DRINK".tr,
      type: TabBarEnum.drink,
    ),
    TabBarMenuModel(
      icon: ImageConstant.imgDrink,
      activeIcon: ImageConstant.imgDrink,
      title: "DRINK".tr,
      type: TabBarEnum.drink,
    ),
    TabBarMenuModel(
      icon: ImageConstant.imgDrink,
      activeIcon: ImageConstant.imgDrink,
      title: "DRINK".tr,
      type: TabBarEnum.drink,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.nameOfCategory.isEmpty ? 1 : controller.nameOfCategory.length,
      child: Column(
        children: [
          Obx(() {
            return TabBar(
              controller: _tabController,
              isScrollable: true,
              dividerColor: Colors.transparent,
              labelColor: theme.colorScheme.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 1.0,
              unselectedLabelColor: appTheme.gray500,
              indicatorColor: Colors.transparent,
              onTap: (index) {
                controller.setSelectedIndex(index);
                controller.selectedIndex.value =index;
              },
              tabs: List.generate(controller.nameOfCategory.isEmpty ? 1 : controller.nameOfCategory.length, (index) {
                return Tab(
                  child: Container(
                    decoration:  controller.selectedIndex.value== index
                        ? AppDecoration.fillDeepBlue.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder15,
                    )
                        : AppDecoration.fillWhiteA.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder15,
                      border: Border.all(color: appTheme.gray500),
                    ),
                    height: 42.v,
                    width: 130.h,
                    child: _buildTabBarItem(
                      controller.nameOfCategory[index],
                      controller.selectedIndex.value== index
                          ? appTheme.whiteA700
                          : appTheme.blue300,
                      controller.selectedIndex.value == index
                          ? appTheme.whiteA700
                          : appTheme.orange800,
                    ),
                  ),
                );
              }),
            );
          }),
          SizedBox(height: 10.v),
          Expanded(child:TabBarView(
            controller: _tabController,
            children: controller.nameOfCategory.map((element){
              return const FastFodItemCard();
            }).toList(),
          ),
          )
        ],
      ),
    );

  }
  Widget _buildTabBarItem(String? title, Color color, Color colorIcon) {
    return Row(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          height: 20.adaptSize,
          width: 20.adaptSize,
          color: colorIcon,
          margin: EdgeInsets.only(right: 10.v),
          imagePath: ImageConstant.imgBurger,
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.v, bottom: 4.v),
          child: Text(
            title ?? "",
            style: CustomTextStyles.bodySmallPoppinsBlack900Light_1
                .copyWith(color: color),
          ),
        ),
      ],
    );
  }

}

enum TabBarEnum {
  fastFood,
  fish,
  dessert,
  drink,
}

class TabBarMenuModel {
  TabBarMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  final String icon;
  final String activeIcon;
  final String? title;
  final TabBarEnum type;
}

class TabBarViewWidget extends StatelessWidget {
  final TabBarEnum type;

  const TabBarViewWidget({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case TabBarEnum.fastFood:
        return const FastFodItemCard();
      case TabBarEnum.fish:
        return FishItemCard();
      case TabBarEnum.dessert:
        return DessertItemCard();
      case TabBarEnum.drink:
        return DrinkItemCard();
    }
  }
}
