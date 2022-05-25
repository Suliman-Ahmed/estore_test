// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:estore_test/constant/custom_colors.dart';
// import 'package:estore_test/constant/widgets/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

// class CustomDrawer extends StatefulWidget {
//   const CustomDrawer({Key? key}) : super(key: key);

//   @override
//   _CustomDrawerState createState() => _CustomDrawerState();
// }

// class _CustomDrawerState extends State<CustomDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: Get.width * 0.70,
//       color: CustomColors.white,
//       child: ListView(
//         children: [
//           Container(
//             height: Get.height * 0.25,
//             color: CustomColors.primary,
//             alignment: Alignment.center,
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//               Container(
//                 width: Get.width * 0.30,
//                 height: Get.width * 0.30,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: CustomColors.white,
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(2000),
//                   child: CachedNetworkImage(
//                     imageUrl: 'https://picsum.photos/200/300?random',
//                     progressIndicatorBuilder: (context, url, downloadProgress) =>
//                         Image.asset('assets/img/logo.png'),
//                     errorWidget: (context, url, error) => Icon(Icons.error),
//                     width: Get.width,
//                     height: Get.width * 0.60,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 // Image.network(
//                 //   'https://estoreiraq.com/wp-content/uploads/2020/12/cropped-logo2.png',
//                 //   fit: BoxFit.contain,
//                 // width: Get.width * 0.22,
//                 // height: Get.width * 0.22,
//                 // ),
//               ),
//               CustomText(
//                 text: 'User 1',
//                 textColor: CustomColors.white,
//                 isBoldText: true,
//                 padding: EdgeInsets.all(20),
//               ),
//             ]),
//           ),
//           //////////////////////////////////////////////////////////
//           /// Items
//           ListTile(
//             leading: Icon(Iconsax.profile_circle5),
//             title: Text('تغيير الحساب'),
//             // selected: _selectedDestination == 0,
//             // onTap: () => selectDestination(0),
//           ),
//           ListTile(
//             leading: Icon(Icons.delete),
//             title: Text('عن المدرسة'),
//             // selected: _selectedDestination == 1,
//             // onTap: () => selectDestination(1),
//           ),
//           ListTile(
//                   leading: Icon(Iconsax.translate5),
//                   title: CustomText(
//                     text: 'اللغة',
//                   ),
//                   trailing: DropdownButtonHideUnderline(
//                     child: DropdownButton<Languagess>(
//                       hint: Text("Select item"),
//                       value: selectedLang,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedLang = value!;
//                           Get.updateLocale(Locale(value.code, value.lang));
//                         });
//                       },
//                       items: langs.map((Languagess lang) {
//                         return DropdownMenuItem<Languagess>(
//                           value: lang,
//                           child: Row(
//                             children: <Widget>[
//                               CustomText(
//                                 text: lang.lang,
//                               ),
//                             ],
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ),
//         ],
//       ),
//     );
//   }
// }

