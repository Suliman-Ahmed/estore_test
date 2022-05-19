import 'package:cached_network_image/cached_network_image.dart';
import 'package:estore_test/app/modules/main_page/controllers/cart_controller.dart';
import 'package:estore_test/constant/constants.dart';
import 'package:estore_test/constant/custom_colors.dart';
import 'package:estore_test/constant/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class BuyView extends GetView<CartController> {
  String dropdownvalue = '1';

  var items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'ي ستور'),
        centerTitle: true,
      ),
      body: Obx(
        () => SafeArea(
          child: controller.getCartCount != 0
              ? ListView(children: [
                  /////////////////////////////////////
                  /// List Of Cart Product
                  buildCartList()
                  /////////////////////////////////////
                  /// Cart Price
                ])
              :
              /////////////////////////////////////
              /// Empty Cart
              buildEmptyCartView(),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     controller.cart_count.value++;
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }

  //////////////////////////////////////////////////////////
  /// [BUILD CART LIST]
  Widget buildCartList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: controller.getCartCount,
      itemBuilder: (ctx, index) => buildCartItem(index),
    );
  }

  Widget buildCartItem(int index) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.all(15),
      height: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///////////////////////////////////////
              /// [Image]
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: CustomColors.nonActiveIconColor, width: 1),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: Constants.productList[index]['img'],
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            Image.asset('assets/img/logo.png'),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              ////////////////////////////////////////////////////////
              /// [Title, Price, Attributes, Price]
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // [TITLE]
                        CustomText(
                          text:
                              '${Constants.productList[index]['name']} jkkkkkkkk hhhhhhh',
                          fontSize: 20.0,
                          overflow: TextOverflow.ellipsis,
                          textColor: CustomColors.textColor,
                        ),
                        // [CODE]
                        CustomText(
                          text: 'ESTORE20221',
                          textColor: CustomColors.textColor2,
                        ),
                        // [Attributes]
                        CustomText(
                          text: '${Constants.productList[index]['name']}',
                          textColor: CustomColors.textColor2,
                        ),
                        // [Price]
                        CustomText(
                          text: '${Constants.productList[index]['price']}',
                          textColor: CustomColors.textColor,
                        ),
                      ]),
                ),
              ),
              ////////////////////////////////////////////////////
              /// [Delete Button]
              IconButton(
                onPressed: () {
                  print('Delete');
                },
                icon: Icon(
                  IconlyBold.delete,
                  color: CustomColors.red,
                ),
              ),
              ///////////////////////////////////////////////////////
            ],
          ),
          //////////////////////////////////////////////////////////
          SizedBox(height: 10),
          //////////////////////////////////////////////////////////
          Row(
            children: [
              /// [Item Count]
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: CustomColors.nonActiveIconColor),
                    borderRadius: BorderRadius.circular(8)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    // Initial Value
                    value: dropdownvalue,

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: CustomText(
                          text: items,
                          textColor: CustomColors.nonActiveIconColor,
                        ),
                      );
                    }).toList(),

                    // Down Arrow Icon
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                    ),

                    onChanged: (String? newValue) {
                      dropdownvalue = newValue!;
                    },
                  ),
                ),
              ),
              ////////////////////////////////////////////////
              /// Add to FAV
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  child: InkWell(
                    onTap: () => print('Add to fav'),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite,
                            color: CustomColors.nonActiveIconColor),
                        SizedBox(width: 20),
                        CustomText(
                          text: 'أضافة الى المفضلة',
                          textColor: CustomColors.nonActiveIconColor,
                          fontSize: 18.0,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  //////////////////////////////////////////////////////////
  /// [BIULD EMPTY CART]
  Widget buildEmptyCartView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: Get.width,
            height: Get.width * 0.7,
            child: SvgPicture.asset(Constants.EMPTY_CART)),
        SizedBox(height: 30),
        CustomText(
          text: 'سلتك فارغة',
          fontSize: Get.width * 0.06,
          textColor: CustomColors.primary,
        )
      ],
    );
  }
}
