import 'package:cat_avatar_generator/cat_avatar_generator.dart';
import 'package:estore_test/constant/custom_colors.dart';
import 'package:estore_test/constant/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool darkMode = false;

  bool lang = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// [App Bar]
      appBar: AppBar(
        title: CustomText(
          text: 'ي ستور',
          fontFamily: 'GESS',
        ),
        centerTitle: true,
        elevation: 0,
      ),

      drawer: Drawer(),

      /// [Background Color]
      backgroundColor: Colors.white,

      /// [Body]
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                /// [Avatar]
                CircleAvatar(
                  radius: 45,
                  child: Image(image: MeowatarImage.fromString("a@a.com")),
                ),
                SizedBox(
                  width: 20,
                ),

                /// [Name and subtitle]
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Suliman Ahmed',
                      isBoldText: true,
                    ),
                    SizedBox(height: 5),
                    CustomText(text: 'Baghdad'),
                  ],
                ),
              ],
            ),
          ),

          /// [Email and password]
          Container(
            width: Get.width,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.mark_email_unread_outlined),
                  title: CustomText(text: 'Email'),
                  subtitle: CustomText(text: 'test@gmail.com'),
                ),
                ListTile(
                  leading: Icon(Icons.lock_open_rounded),
                  title: CustomText(text: 'Password'),
                  subtitle: CustomText(text: 'test@gmail.com'),
                ),
              ],
            ),
          ),

          /// [Darkmode and Language]
          Container(
            width: Get.width,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                SwitchListTile(
                  value: darkMode,
                  onChanged: (value) {
                    setState(() {
                      darkMode = value;
                    });
                  },
                  secondary: Icon(Icons.language_outlined),
                  activeColor: CustomColors.primary,
                  title: CustomText(text: 'الوضع الليلي'),
                ),
                SwitchListTile(
                  value: lang,
                  onChanged: (value) {
                    setState(() {
                      lang = value;
                    });
                  },
                  secondary: Icon(Icons.language_outlined),
                  activeColor: CustomColors.primary,
                  title: CustomText(text: 'اللغة',),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: CustomColors.primary,
            ),
            width: Get.width,
            child: MaterialButton(
              onPressed: () {},
              child: CustomText(
                text: 'تسجيل الخروج',
                textColor: Colors.white,
                fontFamily: 'GESS',
                isBoldText: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
