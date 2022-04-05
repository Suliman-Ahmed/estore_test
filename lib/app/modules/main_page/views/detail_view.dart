import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:estore_test/constant/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int numberOfItems = 1;

  List colors = [
    '89CFF0',
    'FFD700',
    '251607',
    'C0C0C0',
  ];

  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

  // ignore: prefer_function_declarations_over_variables
  String Function(Match) mathFunc = (Match match) => '${match[1]},';

  CarouselController carouselController = CarouselController();
  int indexOfImage = 0;
  int indexOfColor = 0;
  int indexOfSize = 0;

  List images = [];

  List<Widget> items({bool small = false}) {
    List<Widget> item = [];

    switch (indexOfColor) {
      case 0:
        images = Constants.blueImages;
        break;
      case 1:
        images = Constants.goldImages;
        break;
      case 2:
        images = Constants.blackImages;
        break;
      case 3:
        images = Constants.silverImages;
        break;
      default:
        images = Constants.blueImages;
    }

    small
        ? images.forEach((element) {
            item.add(
              // InkWell(
              //   onTap: () {
              //     carouselController.animateToPage(images.indexOf(element));
              //   },
              //   child: Container(
              //     color: Colors.white,
              //     padding: const EdgeInsets.all(8.0),
              //     child: Image.asset(
              //       element,
              //       fit: BoxFit.cover,
              //       width: 65,
              //       height: 65,
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: () {
                  carouselController.animateToPage(images.indexOf(element));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: element!,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            Image.asset('assets/img/logo.png'),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    width: 65,
                    height: 65,
                  ),
                ),
              ),
            );
          })
        : images.forEach((element) {
            item.add(
              // Image.asset(
              //   element,
              //   fit: BoxFit.cover,
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.width,
              // ),
              CachedNetworkImage(
                imageUrl: element!,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Image.asset('assets/img/logo.png'),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: Get.width * 0.60,
                height: Get.width * 0.60,
                fit: BoxFit.cover,
              ),
            );
          });

    return item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFEF511D),
        title: const Text(
          'Back',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: _buildBody(),
          ),
          /////////////////////////////////////////////
          /// Add Button
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: _buildAddButton(),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: [
        ////////////////////////////////////////////////////////////////////////
        /// Image
        Stack(
          children: [
            CarouselSlider(
              items: items(),
              carouselController: carouselController,
              options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  enlargeCenterPage: true,
                  initialPage: 0,
                  height: MediaQuery.of(context).size.width,
                  viewportFraction: 1,
                  onPageChanged: (index, chan) {
                    indexOfImage = index;
                    setState(() {});
                  }),
            ),
            //////////////////////
            /// Dote
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 30,
                width: MediaQuery.of(context).size.width / 2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items().length,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (c, i) => Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: indexOfImage == i
                          ? const Color(0xFFEF511D)
                          : const Color(0xFFEF511D).withOpacity(.5),
                    ),
                  ),
                ),
              ),
            ),
            ////////////////////////////////////////////////////////////////////
          ],
        ),
        ////////////////////////////////////////////////////////////////////////
        /// List Of Images
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: items(small: true),
          ),
        ),
        ////////////////////////////////////////////////////////////////////////
        /// Title and Price
        ListTile(
          title: Text(
            'iPhone 13 Pro Max'.toString(),
            style: TextStyle(
              fontSize: 23,
              color: Color(0xFFEF511D),
              fontWeight: FontWeight.bold,
            ),
          ),
          ///////////////////////////////////////
          /// Price
          subtitle: Text(
            Constants.sized[indexOfSize]['price']
                    .toString()
                    .replaceAllMapped(reg, mathFunc) +
                '\$',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black45,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ////////////////////////////////////////////////////////////////////////
        /// Pic Color Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              const Text(
                'Pick a Color: ',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 75,
                  child: buildColors(),
                ),
              ),
            ],
          ),
        ),
        ////////////////////////////////////////////////////////////////////////
        /// Pic Size Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              const Text(
                'Pick a Size: ',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: buildSize(),
                ),
              ),
            ],
          ),
        ),
        ////////////////////////////////////////////////////////////////////////
        ListTile(
          title: Text('توصيل سريع لكل محافظات العراق'),
          leading: Icon(Icons.directions_car_outlined),
        ),
        ListTile(
          title: Text('منتجاتنا اصلية من افضل الشركات'),
          leading: Icon(Icons.health_and_safety_outlined),
        ),
        ListTile(
          title: Text('تسوق بأمان مع ي ستور'),
          leading: Icon(Icons.lock_outline_rounded),
        ),
        ////////////////////////////////////////////////////////////////////////
        /// Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Text(
            Constants.des,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ////////////////////////////////////////////////////////////////////////
        /// Related Products
        SizedBox(
          height: 275,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => _buildListItem(),
          ),
        ),
        ///////////////////////////////////////////////////////////////////////
        const SizedBox(height: 100)
      ],
    );
  }

  Widget buildColors() {
    List<Widget> item = [];
    colors.forEach((element) {
      item.add(InkWell(
        onTap: () {
          setState(() {
            indexOfColor = colors.indexOf(element);
          });
        },
        child: Container(
          width: 30,
          height: 30,
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(int.parse('0xFF$element')),
              border: Border.all(
                  color: colors.indexOf(element) == indexOfColor
                      ? Color(0xffEF511D)
                      : Colors.white,
                  width: 2)),
        ),
      ));
    });
    return ListView(
      scrollDirection: Axis.horizontal,
      children: item,
    );
  }

  Widget buildSize() {
    List<Widget> item = [];
    Constants.sized.forEach((element) {
      item.add(InkWell(
        onTap: () {
          setState(() {
            indexOfSize = Constants.sized.indexOf(element);
          });
        },
        child: Container(
          height: 45,
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: Color(
              indexOfSize == Constants.sized.indexOf(element)
                  ? 0xffEF511D
                  : 0xffFFFFFF,
            ).withOpacity(0.2),
            border: Border.all(color: Color(0xffEF511D), width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                element['size'].toString(),
                style: const TextStyle(
                  color: Color(0xffEF511D),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ));
    });
    return ListView(
      scrollDirection: Axis.horizontal,
      children: item,
    );
  }

  Widget _buildAddButton() {
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: 70,
        child: Row(
          children: [
            /////////////////////////////////////////////////
            ///plus Button
            IconButton(
                onPressed: () {
                  setState(() {
                    numberOfItems++;
                  });
                },
                icon: const Icon(
                  Icons.add,
                  color: Color(0xFFEF511D),
                )),
            /////////////////////////////////////////////////
            ///Number of Items
            Text(
              '$numberOfItems',
              style: const TextStyle(fontSize: 19),
            ),
            /////////////////////////////////////////////////
            ///Remove Button
            IconButton(
                onPressed: () {
                  setState(() {
                    if (numberOfItems > 0) {
                      numberOfItems--;
                    }
                  });
                },
                icon: const Icon(
                  Icons.remove,
                  color: Color(0xFFEF511D),
                )),

            ////////////////////////////////////////////////////
            // Add Button
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffEF511D),
                ),
                child: MaterialButton(
                  onPressed: () {
                    debugPrint('Add to Cart');
                  },
                  height: 70,
                  child: const Center(
                    child: Text(
                      'أضافة الى العربة',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem() {
    return Container(
      width: 185,
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Material(
        color: Colors.white,
        elevation: 2,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //////////////////////////////////////////////////////////////////
              /// Product image
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CachedNetworkImage(
                    imageUrl: Constants.blackImages[0],
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            Image.asset('assets/img/logo.png'),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    width: Get.width,
                    height: Get.width,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //////////////////////////////////////////////////////////////////
              /// Product name
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Product Name',
                  textAlign: TextAlign.start,
                  // textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              //////////////////////////////////////////////////////////////////
              /// Product price and add button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '25 \$',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffEF511D),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffEF511D),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 25,
                      ),
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
