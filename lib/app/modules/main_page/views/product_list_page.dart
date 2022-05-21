import 'package:estore_test/constant/constants.dart';
import 'package:estore_test/constant/widgets/custom_text.dart';
import 'package:estore_test/constant/widgets/h_product_list.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// [ App Bar ]
      appBar: AppBar(
        title: CustomText(
          text: 'سماعات',
          fontFamily: 'GESS',
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: Constants.productList.length,
        itemBuilder: (BuildContext context, int index) {
          return HProductList(
            index: index,
            img: Constants.productList[index]['img'],
            title: Constants.productList[index]['name'],
            price: Constants.productList[index]['price'],
            des: Constants.productList[index]['des'],
          );
        },
      ),
    );
  }
}
