import 'package:get/get.dart';

class CartController extends GetxController {

  final cart_count = 1.obs;

  int get getCartCount => cart_count.value;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

}
