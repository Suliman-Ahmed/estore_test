import 'package:get/get.dart';

import 'package:estore_test/app/modules/home/bindings/home_binding.dart';
import 'package:estore_test/app/modules/home/views/home_view.dart';
import 'package:estore_test/app/modules/login/bindings/login_binding.dart';
import 'package:estore_test/app/modules/login/views/login_view.dart';
import 'package:estore_test/app/modules/main_page/bindings/main_page_binding.dart';
import 'package:estore_test/app/modules/main_page/views/main_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_PAGE,
      page: () => MainPageView(),
      binding: MainPageBinding(),
    ),
  ];
}
