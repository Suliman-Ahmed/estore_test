import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:estore_test/constant/constants.dart';
import 'package:estore_test/constant/custom_colors.dart';
import 'package:estore_test/constant/widgets/custom_text.dart';
import 'package:estore_test/constant/widgets/list_view_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        title: CustomText(text: 'ي ستور',fontFamily: 'GESS',),
        centerTitle: true,
        elevation: 0,
      ),
      ///
      drawer: Drawer(),
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
              buildCate(),

              /// [new Products]
              buildShowAll('وصلنا حديثا'),
              buildListOfProducts(Constants.productList),

              /// [new Products]
              buildShowAll('أجهزة رائدة'),
              buildListOfProducts(Constants.cablesList),

              /// [common sections]
              Container(
                margin: EdgeInsets.all(10),
                child: CustomText(
                  text: 'أقسام شائعة',
                  textDirection: TextDirection.rtl,
                ),
              ),
              buildCommonSections(),

              
              /// [Starred Products]
              buildShowAll('مميزة'),
              buildListOfProducts(Constants.productList),

              /// [new Products]
              buildShowAll('كفرات'),
              buildListOfProducts(Constants.cablesList),
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
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'هل تبحث عن منتج معين...',
                  suffixIcon: Icon(IconlyBroken.search)),
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
            Row(
              children: [
                CustomText(text: 'أظهار الكل'),
                SizedBox(width: 15),
                Icon(IconlyLight.arrow_left_2),
              ],
            ),
            CustomText(text: text),
          ],
        ),
      );
  buildListOfProducts(List items) => Container(
        height: 225,
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) => ListProductBlock(
            name: items[index]['name'],
            img: items[index]['img'],
            price: items[index]['price'],
          ),
        ),
      );

  buildCommonSections() => Container(
    width: double.infinity,
    height: 100,
    child: ListView.builder(
      itemCount: Constants.commonCategory.length,
      scrollDirection: Axis.horizontal,
      reverse: true,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Container(
        width: 75,
        height: 75,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(width: 0.2,color: Colors.grey),
        ),
        child: Image.asset(Constants.commonCategory[index]),
      ),
    ),
  );
}
