import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:estore_test/constant/constants.dart';
import 'package:estore_test/constant/custom_colors.dart';
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
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            /// [Srarch bar]
            buildSearchBar(),

            /// [Image Slider]
            buildCarousel(),

            /// [Category]
            buildCate(),

            /// [new Products]
            buildShowAll('وصلنا حديثا'),
            buildListOfProducts(),
          ],
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
                  hintText: 'Search...',
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
                            width: 20,
                            height: 20,
                          ),
                          // child: Image.asset('assets/img/ipad6.jpg',width: 20,),
                        ),
                        SizedBox(height: 10),
                        Text(item['text']),
                      ],
                    ),
                  ))
              .toList(),
        ),
      );

  buildShowAll(String text) => Padding(
    padding: EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Row(
          children: [
            Text('أظهار الكل'),
            Icon(IconlyLight.arrow_right),
          ],
        )
      ],
    ),
  );
  buildListOfProducts() => Container(
    height: 200,
    width: double.infinity,
    child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: Constants.productList.length,
          itemBuilder: (BuildContext context, int index) => Container(
            margin: EdgeInsets.all(20),
            color: Colors.black38,
            child: Text('Product ${index + 1}'),
          ),
        ),
  );
}
