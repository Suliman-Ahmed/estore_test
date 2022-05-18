import 'package:estore_test/app/modules/main_page/controllers/main_page_controller.dart';
import 'package:estore_test/constant/constants.dart';
import 'package:estore_test/constant/custom_colors.dart';
import 'package:estore_test/constant/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CatagoryView extends GetView<MainPageController> {
  int selectedCatagory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            text: 'ي ستور',
            fontFamily: 'GESS',
          ),
          centerTitle: true,
        ),
        body: Row(
          children: [
            ///////////////////////////////////////////////
            /// [Main Category Menu]
            Expanded(child: buildCategoryList()),

            ///////////////////////////////////////////////
            /// [Sub Category Menu]
            Expanded(
                child: ListView(
              children: [
                buildSubCategoryList(),
              ],
            )),
          ],
        ));
  }

  /////////////////////////////////////////////////////////////
  /// [SUB_MENU]
  Widget buildSubCategoryList() => Obx(
        () => Container(
          child: Constants.categoryItem[controller.getCatItemIndex]['items']
                      .length ==
                  0
              ? Image.asset('assets/img/logo.png')
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: Constants
                      .categoryItem[controller.getCatItemIndex]['items'].length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    return Obx(() => buildSubItem(ctx, index));
                  },
                ),
        ),
      );

  ////////////////////////////////////////////////////////////////////
  /// [Sub Item]
  Widget buildSubItem(ctx, index) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: controller.getSubCatItemIndex == index
                  ? CustomColors.primary.withOpacity(0.3)
                  : Colors.white,
              borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            /// [title]
            title: CustomText(
              text: Constants.categoryItem[controller.getCatItemIndex]['items']
                  [index]['title'],
              fontFamily: 'GESS',
            ),

            /// [Trailing]
            trailing: Icon(
              controller.getSubCatItemIndex == index
                  ? Icons.keyboard_arrow_down_rounded
                  : Icons.keyboard_arrow_right_rounded,
            ),

            /// [Function]
            onTap: () {
              controller.changeSubCatItem(index);
              // print(controller.getCatItemIndex);
            },

            /// [indide list]
            // subtitle: controller.getSubCatItemIndex == index
            //     ? buildSubsubCatList()
            //     : SizedBox(),
          ),
        ),

        ///
        Visibility(
          visible: controller.getSubCatItemIndex == index,
          child: buildSubsubCatList(),
        )
      ],
    );
  }

  ////////////////////////////////////////////////////////////////////
  /// [SUB SUB MENU]
  Widget buildSubsubCatList() => Obx(() => Container(
        child: Constants
                    .categoryItem[controller.getCatItemIndex]['items'][0]
                        ['items']
                    .length ==
                0
            ? Image.asset('assets/img/logo.png')
            : ListView.builder(
                itemCount: Constants
                    .categoryItem[controller.getCatItemIndex]['items']
                        [controller.getSubCatItemIndex]['items']
                    .length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) => ListTile(
                  title: CustomText(
                      text: Constants.categoryItem[controller.getCatItemIndex]
                              ['items'][0]['items'][index]['title']
                          .toString(),fontFamily: 'GESS',),
                  onTap: () {},
                ),
              ),
      ));

  ////////////////////////////////////////////////////////////////////
  /// [BUILD Main List]
  Widget buildCategoryList() => Container(
        alignment: Alignment.topCenter,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: Constants.categoryItem.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (ctx, index) {
            return Obx(() => buildMainItem(ctx, index));
          },
        ),
      );

  Widget buildMainItem(ctx, index) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: controller.getCatItemIndex == index
              ? CustomColors.primary.withOpacity(0.3)
              : Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        /// [title]
        title: CustomText(
          text: Constants.categoryItem[index]['title'],
          fontFamily: 'GESS',
        ),

        /// [Trailing]
        trailing: Icon(
          controller.getCatItemIndex == index
              ? Icons.keyboard_arrow_right_rounded
              : Icons.keyboard_arrow_down_rounded,
        ),

        /// [Function]
        onTap: () {
          controller.changeCatItem(index);
          // print(Constants
          //     .categoryItem[controller.getCatItemIndex]['items'][controller.getSubCatItemIndex]
          //         ['items']
          //     .length
          //     .toString());
        },
      ),
    );
  }
}
