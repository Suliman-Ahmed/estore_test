import 'package:estore_test/constant/custom_colors.dart';
import 'package:flutter/material.dart';
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
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          /// [image]
          Image.asset(
            widget.img!,
            fit: BoxFit.cover,
            width: 160,
          ),

          /// [img]
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
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  FittedBox(
                    child: Text(
                      widget.name!,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Text(widget.price!)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
