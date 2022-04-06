import 'package:get/get.dart';

class MainPageController extends GetxController {
  var _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  changeValue(int newValue) {
    _selectedIndex.value = newValue;
    update();
  }

  final count = 0.obs;
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
  void increment() => count.value++;

  void valueCha(bool value) {
    value = !value;
    update();
  }

  /////////////////////////// [Category Page] ////////////////////////////////
  RxInt categoryItem = 0.obs;
  RxInt subCategoryItem = 0.obs;

  int get getCatItemIndex => categoryItem.value;
  int get getSubCatItemIndex => subCategoryItem.value;

  void changeCatItem(int newValue) => categoryItem.value = newValue;
  void changeSubCatItem(int newValue) => subCategoryItem.value = newValue;
}
