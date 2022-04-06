import 'package:cached_network_image/cached_network_image.dart';
import 'package:estore_test/app/modules/main_page/views/detail_view.dart';
import 'package:estore_test/constant/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ListProductBlock extends StatefulWidget {
  final String? name;
  final String? img;
  final String? price;

  ListProductBlock({this.name, this.img, this.price});

  @override
  ListProductBlockState createState() => ListProductBlockState();
}

class ListProductBlockState extends State<ListProductBlock> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(DetailPage()),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
              spreadRadius: 0.01,
              offset: Offset(0,0)
            )
          ]
        ),
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            /// [image]
            ClipRRect(
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
                  child: Icon(isFav ? IconlyBold.heart : IconlyLight.heart),
                ),
              ),
            ),
    
            /// [name and price]
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 56,
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
                      Text(
                        widget.name!,
                        overflow: TextOverflow.ellipsis,
                        // style: TextStyle(fontSize: 16),
                      ),
                      Text(widget.price!)
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
