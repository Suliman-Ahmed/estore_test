import 'package:cat_avatar_generator/cat_avatar_generator.dart';
import 'package:estore_test/app/modules/main_page/views/chat_ui.dart';
import 'package:estore_test/constant/custom_colors.dart';
import 'package:estore_test/constant/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';

class ProfileView extends StatefulWidget {
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool darkMode = false;

  bool lang = false;

  List<Languagess> langs = [
    Languagess('ar', 'عربي'),
    Languagess('en', 'English'),
  ];

  List<Currency> curency = [
    Currency('عراقي', 'ع.د'),
    Currency('دولار', '\$'),
  ];

  late Languagess selectedLang;
  late Currency selectedCurency;

  @override
  void initState() {
    selectedLang = langs.first;
    selectedCurency = curency.first;
    super.initState();
  }

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
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                /// [Avatar]
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200/300?random'),
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
                  subtitle: CustomText(text: '********************'),
                ),
              ],
            ),
          ),

          /// [Darkmode and Language]
          Container(
            width: Get.width,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.fromLTRB(15,0,15,15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                /////////////////////////////////////////////////////////
                /// 
                ListTile(
                  onTap: () {
                    Get.to(() => ChatPage());
                  },
                  leading: Icon(Iconsax.message),
                  title: CustomText(
                    text: 'ملاحظات او شكاوي',
                  ),
                ),
                //////////////////////////////////////////////////////////
                /// Previus Orders
                ListTile(
                  leading: Icon(Iconsax.clipboard_text5),
                  title: CustomText(
                    text: 'طلباتي',
                  ),
                ),
                //////////////////////////////////////////////////////////
                /// My Info
                ListTile(
                  leading: Icon(Iconsax.location5),
                  title: CustomText(
                    text: 'معلوماتي',
                  ),
                ),
                //////////////////////////////////////////////////////////
                /// Currency
                ListTile(
                  leading: Icon(Iconsax.coin_15),
                  title: CustomText(
                    text: 'العملة',
                  ),
                  trailing: DropdownButtonHideUnderline(
                    child: DropdownButton<Currency>(
                      hint: Text("Select item"),
                      value: selectedCurency,
                      onChanged: (value) {
                        setState(() {
                          selectedCurency = value!;
                        });
                      },
                      items: curency.map((Currency cur) {
                        return DropdownMenuItem<Currency>(
                          value: cur,
                          child: Row(
                            children: <Widget>[
                              CustomText(
                                text: cur.curncy,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                ///////////////////////////////////////////////////////////
                /// Languages
                ListTile(
                  leading: Icon(Iconsax.translate5),
                  title: CustomText(
                    text: 'اللغة',
                  ),
                  trailing: DropdownButtonHideUnderline(
                    child: DropdownButton<Languagess>(
                      hint: Text("Select item"),
                      value: selectedLang,
                      onChanged: (value) {
                        setState(() {
                          selectedLang = value!;
                          Get.updateLocale(Locale(value.code, value.lang));
                        });
                      },
                      items: langs.map((Languagess lang) {
                        return DropdownMenuItem<Languagess>(
                          value: lang,
                          child: Row(
                            children: <Widget>[
                              CustomText(
                                text: lang.lang,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
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

class Languagess {
  final String code;
  final String lang;
  Languagess(this.code, this.lang);
}

class Currency {
  final String curncy;
  final String sign;
  Currency(this.curncy, this.sign);
}
