import 'package:get/get.dart';
import 'package:restaurant_app/bindings/detail_screen_binding.dart';
import 'package:restaurant_app/bindings/favorite_screen_binding.dart';
import 'package:restaurant_app/bindings/history_binding.dart';
import 'package:restaurant_app/bindings/login_binding.dart';
import 'package:restaurant_app/bindings/search_binding.dart';
import 'package:restaurant_app/bindings/sign_up_binding.dart';
import 'package:restaurant_app/screens/complete_booking/complete_booking_screen.dart';
import 'package:restaurant_app/screens/complete_booking/complete_shop.dart';
import 'package:restaurant_app/screens/display_table_screeen/display_all_table_screen.dart';
import 'package:restaurant_app/screens/history_order_screen/history_order_screen.dart';
import 'package:restaurant_app/screens/history_order_screen/widget/detail_order.dart';
import 'package:restaurant_app/screens/search_screen/search_screen.dart';
import 'package:restaurant_app/screens/user_screen/user_profile_screen/chnagepassword_screen.dart';
import 'package:restaurant_app/screens/user_screen/user_profile_screen/main_profile_screen.dart';
import '../../bindings/splash_screen_binding.dart';
import '../bindings/binding_table_screen.dart';
import '../bindings/checkout_screen_binding.dart';
import '../bindings/chnagepass_binding.dart';
import '../bindings/edit_profile_binding.dart';
import '../bindings/main_profile_binding.dart';
import '../bindings/root_binding.dart';
import '../screens/booking_table_screen/booking_table_screen.dart';
import '../screens/cart_screen/cart_screen.dart';
import '../screens/cetegory_screen/category_screen.dart';
import '../screens/checkout_screen/checkout_screen.dart';
import '../screens/contact_us_screen/contact_us_screen.dart';
import '../screens/detail_screen/detail_screen.dart';
import '../screens/favorite-screen/favorite_screen.dart';
import '../screens/get_start_screen/get_start_screen.dart';
import '../screens/home_screen/home_page.dart';
import '../screens/home_screen/home_screen_container.dart';
import '../screens/menu-screen/menu_screen.dart';
import '../screens/menu-screen/widgets/dessert.dart';
import '../screens/menu-screen/widgets/drink.dart';
import '../screens/menu-screen/widgets/fast_food.dart';
import '../screens/menu-screen/widgets/fish.dart';
import '../screens/payment_screen/add_payment.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../screens/user_screen/auth_screen/forgetpassword_screen.dart';
import '../screens/user_screen/auth_screen/login_screen.dart';
import '../screens/user_screen/auth_screen/otp_screen.dart';
import '../screens/user_screen/auth_screen/sign_up_screen.dart';
import '../screens/user_screen/auth_screen/set_new_password_screen.dart';
import '../screens/user_screen/user_profile_screen/edit_profile_screen.dart';

class AppRoutes {
  static const initialRoute = "/splash_screen";
  static const homePage = "/home_page";
  static const homeScreenContainer = "/home_screen_container";
  static const postScreen = "/post_screen";
  static const contactUsScreen = "/contact_us_screen";
  static const categoryScreen = "/category_screen";
  static const bookingTableScreen = "/booking_table_screen";
  static const menuScreen = "/menu_screen";
  static const cartScreen = "/cart_screen";
  static const fastFoodPage = "/fast_food_page";
  static const fishPage = "/fish_page";
  static const dessertPage = "/dessert_page";
  static const drinkPage = "/drink_page";
  static const detailScreen = "/detail_screen";
  static const loginScreen = "/login_screen";
  static const signUpScreen = "/sign_up_screen";
  static const forgetScreen = "/forget-password_screen";
  static const otpScreen = "/otp-screen";
  static const getStartScreen = "/getstart_screen";
  static const favouriteScreen = "/favourite_screen";
  static const paymentScreen = "/payment_screen";
  static const locationScreen = "/location_screen";
  static const completeBookingScreen = "/complete_booking_screen";
  static const completeShopScreen = "/complete_shop_screen";
  static const checkoutScreen = "/checkout_screen";
  static const setNewPassScreen = "/set_new_password_screen";
  static const mainProfileScreen = "/main_profile_screen";
  static const editProfileScreen = "/edit_profile_screen";
  static const changePassScreen = "/change_password_screen";
  static const tableScreen ="/display_all_table_screen";
  static const searchScreen = "/search_screen";
  static const historyScreen = "/history_screen";
  static const detailOrder = "/detail_order_screen";
  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: homePage,
      page: () => HomePage(),
      binding: RootBinding()
    ),
    GetPage(
        name: homeScreenContainer,
        page: () =>  const HomeContainerScreen(),
        binding: RootBinding()),
    GetPage(
        name: loginScreen,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
      name: signUpScreen,
      page: () => const SignUpScreen(),
      binding: SignUpBinding()
    ),
    GetPage(
      name: forgetScreen,
      page: () => const ForgetPassScreen(),
    ),
    GetPage(
      name: otpScreen,
      page: () => const OtpScreen(),
    ),
    GetPage(
      name: contactUsScreen,
      page: () => const ContactUsScreen(),
    ),
    GetPage(
      name: categoryScreen,
      page: () => const CategoryScreen(),
    ),
    GetPage(
      name: bookingTableScreen,
      page: () => BookTableBottomSheet(),
    ),
    GetPage(
      name: getStartScreen,
      page: () => const GetStartScreen(),
    ),
    GetPage(
      name: favouriteScreen,
      page: () => const FavoriteScreen(),
      binding: FavoriteBinding()
    ),
    GetPage(
      name: menuScreen,
      page: () => const MenuScreen(),
    ),
    GetPage(
      name: fastFoodPage,
      page: () => FastFodItemCard(),
    ),
    GetPage(
      name: fishPage,
      page: () => FishItemCard(),
    ),
    GetPage(
      name: dessertPage,
      page: () => DessertItemCard(),
    ),
    GetPage(
      name: drinkPage,
      page: () => DrinkItemCard(),
    ),
    GetPage(
      name: cartScreen,
      page: () => const CartScreen(),
    ),
    GetPage(
      name: detailScreen,
      page: () => const DetailScreen(),
      binding: DetailScreenBinding(),
    ),
    GetPage(
      name: completeBookingScreen,
      page: () => const CompleteBooking(),
    ),
    GetPage(
      name: completeShopScreen,
      page: () => const CompleteShopScreen(),
    ),
    GetPage(
      name: checkoutScreen,
      page: () => const CheckoutScreen(),
      binding: CheckOutScreenBinding(),
    ),
    GetPage(
      name: setNewPassScreen,
      page: () => const SetNewPasswordScreen(),
    ),
    GetPage(
      name: mainProfileScreen,
      page: () => const MainProfileScreen(),
      binding: MainProfileBinding(),
    ),
    GetPage(
        name: editProfileScreen,
        page: () => EditProfileScreen(),
        binding: EditProfileBinding()),
    GetPage(
      name: changePassScreen,
      page: () => const ChangePasswordScreen(),
      binding: ChangePassBinding(),
    ),
    GetPage(
      name: tableScreen,
      page: () => const AllTableScreen(),
      binding: TableScreenBinding(),
    ),
    GetPage(
        name: paymentScreen,
        page: ()=>const PaymentScreen(),
    ),
    GetPage(
        name: searchScreen,
        page: ()=>const SearchScreen(),
        binding:SearchBinding(),
    ),
    GetPage(
      name: historyScreen,
      page: ()=>const HistoryScreen(),
      binding:RootBinding(),
    ),
    GetPage(
      name: detailOrder,
      page: ()=>const DetailOrder(),
      binding: HistoryBinding()
    ),
  ];
}
