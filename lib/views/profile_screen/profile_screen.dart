import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:ecommerce_seller/views/messages_screen/messages_screen.dart';
import 'package:ecommerce_seller/views/profile_screen/edit_profileScreen.dart';
import 'package:ecommerce_seller/views/shop_setting/shop_setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings,size: 16.0),
        actions: [
          TextButton(onPressed: (){Get.to(()=> EditProfileScreen());}, child: Icon(Icons.edit,color: white,)),
          TextButton(onPressed: (){}, child: normalText(text: 'logout'),),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: Image.asset(imgProducts).box.roundedFull.clip(Clip.antiAlias).make(),
            title: boldText(text: 'Vendor name'),
            subtitle: normalText(text: 'admin@email.com'),

          ),
          Divider(),
          10.heightBox,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: List.generate(profileButtonIcons.length, (index) =>ListTile(
                onTap: () {
                  switch (index) {
                    case 0:
                      Get.to(() => ShopSetting());
                      break;
                      case 1:
                      Get.to(() => MessagesScreen());
                      break;
                    default:
                  }
                },
                leading: Icon(profileButtonIcons[index],color: white,),
                title: normalText(text: profileButtonTiltle[index]),
              )),
            ),
          )
        ],
      ),
    );
  }
}