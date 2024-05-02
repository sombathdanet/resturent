import 'package:get/get.dart';
import 'package:restaurant_app/components/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/history_order_screen/history_order_screen.dart';
import 'package:restaurant_app/themes/theme_helper.dart';
import '../../routes/app_routes.dart';
import '../cart_screen/cart_screen.dart';
import '../favorite-screen/favorite_screen.dart';
import '../menu-screen/menu_screen.dart';
import 'home_page.dart';

class HomeContainerScreen extends StatelessWidget {
  const HomeContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray5001,
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: AppRoutes.homePage,
        onGenerateRoute: (routeSetting) => GetPageRoute(
          page: () => getCurrentPage(routeSetting.name!),
          transition: Transition.noTransition,
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
  }

  ///Handling route based on bottom click actions
   String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.home:
        return AppRoutes.homePage;
      case BottomBarEnum.menu:
        return "/menu_screen";
      case BottomBarEnum.history:
        return AppRoutes.historyScreen;
      case BottomBarEnum.favorite:
        return "/favourite_screen";
      case BottomBarEnum.cart:
        return "/cart_screen";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return  HomePage();
      case AppRoutes.menuScreen:
        return const MenuScreen();
      case AppRoutes.historyScreen:
        return const HistoryScreen();
      case AppRoutes.favouriteScreen:
        return const FavoriteScreen();
      case AppRoutes.cartScreen:
        return const CartScreen();
      default:
        return const DefaultWidget();
    }
  }
}
