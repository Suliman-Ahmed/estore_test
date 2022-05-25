import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:estore_test/app/modules/main_page/views/drawer.dart';
import 'package:estore_test/constant/constants.dart';
import 'package:estore_test/constant/custom_colors.dart';
import 'package:estore_test/constant/widgets/build_common_block.dart';
import 'package:estore_test/constant/widgets/custom_text.dart';
import 'package:estore_test/constant/widgets/grid_list_view_block.dart';
import 'package:estore_test/constant/widgets/list_view_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

final List<String> imgList = [
  'assets/img/img1.png',
  'assets/img/img2.png',
  'assets/img/img3.png',
];

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double? width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      /// [Background Color]
      backgroundColor: Colors.white,

      /// [ App Bar ]
      appBar: AppBar(
        title: CustomText(
          text: 'ي ستور',
          fontFamily: 'GESS',
        ),
        centerTitle: true,
        elevation: 0,
      ),

      //* [ Drawer ]
      drawer: CustomDrawer(),

      ///
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              /// [Srarch bar]
              buildSearchBar(),

              /// [Image Slider]
              buildCarousel(),

              /// [Category]
              // buildCate(),
              SizedBox(height: 20),

              /// [common sections]
              CustomText(
                text: 'أقسام شائعة',
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                fontSize: 22.0,
                fontFamily: 'GESS',
                textColor: CustomColors.textColor,
              ),
              buildCommonSections(),

              /// [new Products]
              CustomText(
                text: 'وصلنا حديثاً',
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                fontSize: 22.0,
                fontFamily: 'GESS',
                textColor: CustomColors.textColor,
              ),
              buildListOfProducts(Constants.productList, 'phoneTag'),

              /// [new Products]
              buildShowAll('أكسسوارات'),
              buildListOfProducts(Constants.cablesList, 'chargerTag'),

              /// [game Products]
              buildShowAll('العاب'),
              buildGridListOfProducts(Constants.productList, 'gameTag'),

              /// [starred Products]
              buildShowAll('مميزة'),
              buildListOfProducts(Constants.cablesList, 'starTag'),

              /// [new Products]
              buildShowAll('كفرات'),
              buildListOfProducts(Constants.cablesList, 'coversTag'),

              /// [power bank]
              buildShowAll('بنوك الطاقة'),
              buildGridListOfProducts(Constants.cablesList, 'powerTag'),
            ],
          ),
        ),
      ),
    );
  }

  buildSearchBar() => Container(
        height: 60,
        width: width,
        color: CustomColors.primary,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: TextField(
              cursorColor: CustomColors.primary,
              style: TextStyle(fontFamily: 'GESS'),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'هل تبحث عن منتج معين...',
                  hintStyle: TextStyle(color: Colors.black.withOpacity(.5)),
                  suffixIcon: Icon(
                    IconlyBroken.search,
                    color: CustomColors.primary,
                  )),
            ),
          ),
        ),
      );

  buildCarousel() => SizedBox(
      height: 200.0,
      width: width,
      child: Carousel(
        images: imgList
            .map((img) => Image.asset(
                  img,
                  fit: BoxFit.cover,
                ))
            .toList(),
        boxFit: BoxFit.cover,
        dotSize: 9.0,
        dotSpacing: 15.0,
        dotIncreaseSize: 1.1,
        dotColor: CustomColors.primary.withOpacity(.5),
        dotIncreasedColor: CustomColors.primary,
        dotBgColor: Colors.white.withOpacity(0),
        showIndicator: true,
        indicatorBgPadding: 5.0,
        borderRadius: true,
        noRadiusForIndicator: true,
        autoplay: true,
      ));

  buildCate() => Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: Constants.cate
              .map((item) => GestureDetector(
                    onTap: () {
                      print('item: ${item['img']}');
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20000),
                              color: CustomColors.primary),
                          child: SvgPicture.asset(
                            item['img'],
                            width: 25,
                            height: 25,
                          ),
                          // child: Image.asset('assets/img/ipad6.jpg',width: 20,),
                        ),
                        SizedBox(height: 10),
                        CustomText(text: item['text']),
                      ],
                    ),
                  ))
              .toList(),
        ),
      );

  buildShowAll(String text) => Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: text,
              padding: EdgeInsets.symmetric(horizontal: 20),
              fontSize: 22.0,
              fontFamily: 'GESS',
              textColor: CustomColors.textColor,
            ),
            Row(
              children: [
                CustomText(text: 'أظهار الكل'),
                SizedBox(width: 15),
                Icon(IconlyLight.arrow_left_2),
              ],
            ),
          ],
        ),
      );

  /////////////////////////////////////////////////////////////
  // Build List Of Items
  buildListOfProducts(List items, String tag) => Container(
        height: 260,
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) => ListProductBlock(
              name: items[index]['name'],
              img: items[index]['img'],
              price: items[index]['price'],
              index: tag + index.toString()),
        ),
      );

  buildGridListOfProducts(List items, String tag) => Container(
        width: Get.width,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          shrinkWrap: true,
          itemCount: items.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) =>
              GridListProductBlock(
                  name: items[index]['name'],
                  img: items[index]['img'],
                  price: items[index]['price'],
                  index: tag + index.toString()),
        ),
      );

  /////////////////////////////////////////////////////////////
  buildCommonSections() => Container(
        width: double.infinity,
        height: 100,
        child: ListView.builder(
          itemCount: Constants.commonIcon.length,
          scrollDirection: Axis.horizontal,
          // reverse: true,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) =>
              BuildCommonSectionBlock(
            index: index,
          ),
        ),
      );
}
