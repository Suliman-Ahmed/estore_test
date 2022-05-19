import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../controllers/main_page_controller.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(
      () => MainPageController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
