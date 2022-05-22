import 'package:cached_network_image/cached_network_image.dart';
import 'package:estore_test/app/modules/main_page/views/detail_view.dart';
import 'package:estore_test/constant/custom_colors.dart';
import 'package:estore_test/constant/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class GridListProductBlock extends StatefulWidget {
  final String? name;
  final String? img;
  final String? price;
  final String? index;

  GridListProductBlock({this.name, this.img, this.price, this.index});

  @override
  GridListProductBlockState createState() => GridListProductBlockState();
}

class GridListProductBlockState extends State<GridListProductBlock> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => DetailPage(
            name: widget.name, price: widget.price, index: widget.index));
        print('${widget.index}');
      },
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          // border: Border.all(width: 0.3,color: Colors.grey)
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 2,
                spreadRadius: 0.01,
                offset: Offset(0, 0))
          ],
        ),
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            /// [image]
            Hero(
              tag: widget.index.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.img!,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Image.asset('assets/img/logo.png'),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  width: 160,
                ),
              ),
            ),

            /// [fav]
            Positioned(
              top: 10,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFav = !isFav;
                  });
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: CustomColors.primary,
                  child: Icon(
                    isFav ? IconlyBold.heart : Icons.favorite_outline_rounded,
                    color: CustomColors.white,
                  ),
                ),
              ),
            ),

            /// [name and price]
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: widget.name!,
                        overflow: TextOverflow.ellipsis,
                        // style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: widget.price!,
                              fontSize: 17.0,
                            ),
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: CustomColors.primary,
                              child: IconButton(
                                color: CustomColors.white,
                                onPressed: () {
                                  print('add to bag');
                                },
                                icon: Icon(
                                  IconlyBold.bag_2,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
