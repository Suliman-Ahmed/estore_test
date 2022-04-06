import 'package:estore_test/app/modules/main_page/controllers/main_page_controller.dart';
import 'package:estore_test/constant/constants.dart';
import 'package:estore_test/constant/custom_colors.dart';
import 'package:estore_test/constant/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
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
            Expanded(child: buildCategoryList()),
            Expanded(
                child: Column(
              children: [
                buildSubCategoryList(),
              ],
            )),
          ],
        ));
  }

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
                    return Obx(() => Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: controller.getSubCatItemIndex == index
                                  ? CustomColors.primary.withOpacity(0.3)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            /// [title]
                            title: CustomText(
                              text: Constants
                                      .categoryItem[controller.getCatItemIndex]
                                  ['items'][index]['title'],
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
                          ),
                        ));
                  },
                ),
        ),
      );

  Widget buildCategoryList() => Container(
        alignment: Alignment.topCenter,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: Constants.categoryItem.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (ctx, index) {
            return Obx(() => Container(
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
                      //     .categoryItem[controller.getCatItemIndex]['items']
                      //     .length
                      //     .toString());
                    },
                  ),
                ));
          },
        ),
      );
}
