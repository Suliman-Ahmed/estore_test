import 'package:estore_test/app/modules/main_page/views/product_list_page.dart';
import 'package:estore_test/constant/constants.dart';
import 'package:estore_test/constant/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BuildCommonSectionBlock extends StatelessWidget {
  final int index;
  const BuildCommonSectionBlock({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(() => ProductListPage(title: '${index+1} Cat',));
      },
      child: Container(
        width: 75,
        height: 75,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CustomColors.primary,
        ),
        child: SvgPicture.asset(
          Constants.commonIcon[index],
          color: Colors.white,
          width: 15,
          height: 15,
        ),
        // child: Image.asset(Constants.commonCategory[index]),
      ),
    );
  }
}
