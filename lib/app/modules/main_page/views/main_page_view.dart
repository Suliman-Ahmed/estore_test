import 'package:estore_test/app/modules/main_page/views/buy_view.dart';
import 'package:estore_test/app/modules/main_page/views/home_view.dart';
import 'package:estore_test/app/modules/main_page/views/catagory_view.dart';
import 'package:estore_test/app/modules/main_page/views/profile_view.dart';
import 'package:estore_test/constant/custom_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';

import '../controllers/main_page_controller.dart';

// ignore: must_be_immutable
class MainPageView extends GetView<MainPageController> {
  List<Widget> _pages = [
    HomeView(),
    CatagoryView(),
    BuyView(),
    ProfileView(),
  ];

  var controller = Get.put(MainPageController());

  int? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    _selectedIndex = controller.selectedIndex;

    return Scaffold(
      body: SafeArea(
        child: GetBuilder<MainPageController>(
          init: MainPageController(),
          builder: (value) => IndexedStack(
            children: _pages,
            index: value.selectedIndex,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          bottom: 10,
          right: 10,
          left: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              textStyle: TextStyle(fontFamily: 'GESS',color: CustomColors.primary),
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: CustomColors.primary,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: CustomColors.primary.withOpacity(.2),
              color: CustomColors.nonActiveIconColor,
              tabs: [
                GButton(
                  icon: IconlyBold.home,
                  text: 'الرئيسية',
                ),
                GButton(
                  icon: IconlyBold.document,
                  text: 'التصنيفات',
                ),
                GButton(
                  icon: IconlyBold.buy,
                  text: 'سلتي',
                ),
                GButton(
                  icon: IconlyBold.profile,
                  text: 'بروفايل',
                ),
              ],
              selectedIndex: _selectedIndex!,
              onTabChange: (index) {
                controller.changeValue(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
