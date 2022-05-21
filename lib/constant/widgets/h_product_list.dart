import 'package:cached_network_image/cached_network_image.dart';
import 'package:estore_test/app/modules/main_page/views/detail_view.dart';
import 'package:estore_test/constant/custom_colors.dart';
import 'package:estore_test/constant/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HProductList extends StatelessWidget {
  final int index;
  final String img;
  final String title;
  final String price;
  final String des;
  var attributes;
  HProductList(
      {Key? key,
      required this.index,
      required this.img,
      required this.title,
      required this.price,
      required this.des,
      this.attributes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(DetailPage(
          index: index.toString(),
          name: title,
          price: price,
        ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///////////////////////////////////////
            /// [Image]
            Hero(
              tag: index.toString(),
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: CustomColors.nonActiveIconColor, width: 1),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: img,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Image.asset('assets/img/logo.png'),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ),
            ////////////////////////////////////////////////////////
            /// [Title, Price, Attributes, Price]
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // [TITLE]
                      CustomText(
                        text: '$title',
                        fontSize: 20.0,
                        overflow: TextOverflow.ellipsis,
                        textColor: CustomColors.textColor,
                      ),
                      // // [CODE]
                      // CustomText(
                      //   text: 'ESTORE20221',
                      //   textColor: CustomColors.textColor2,
                      // ),
                      // [Attributes]
                      CustomText(
                        text: '$des',
                        overflow: TextOverflow.ellipsis,
                        textColor: CustomColors.textColor2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            // [Price]
                            text: '$price',
                            fontSize: 16.0,
                            textColor: CustomColors.textColor,
                          ),
                          // [ADD BUTTON]
                          InkWell(
                            onTap: () {
                              print('Add to bag');
                            },
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: CustomColors.primary,
                                  borderRadius: BorderRadius.circular(8)),
                              child: CustomText(
                                text: 'أضافة الى العربة',
                                isBoldText: true,
                                textColor: CustomColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
