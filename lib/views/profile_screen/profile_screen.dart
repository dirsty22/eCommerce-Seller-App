import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_seller/const/colors.dart';
import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/controller/auth_controller.dart';
import 'package:ecommerce_seller/controller/profile_controller.dart';
import 'package:ecommerce_seller/services/stor_sevices.dart';
import 'package:ecommerce_seller/views/auth_screen/login_screen.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:ecommerce_seller/views/components/loading_indicator.dart';
import 'package:ecommerce_seller/views/messages_screen/messages_screen.dart';
import 'package:ecommerce_seller/views/profile_screen/edit_profileScreen.dart';
import 'package:ecommerce_seller/views/shop_setting/shop_setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: boldText(text: settings, size: 16.0),
          actions: [
            TextButton(
                onPressed: () {
                  Get.to(() => EditProfileScreen(
                        username: controller.snpshotData['vendor_name'],
                      ));
                },
                child: Icon(
                  Icons.edit,
                  color: white,
                )),
            TextButton(
              onPressed: () async {
                await Get.find<Authcontroller>()
                    .SignoutMethod(context: context);
                Get.offAll(() => LoginScreen());
              },
              child: normalText(text: 'logout'),
            ),
          ],
        ),
        body: FutureBuilder(
            future: StoreServices.getProfile(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return loadingIndicator(circleColor: white);
              } else {
                // var data = snapshot.data!.docs[0];
                controller.snpshotData = snapshot.data!.docs[0];
                // print('.......${controller.snpshotData['vendor_name']}');
                return Column(
                  children: [
                    ListTile(
                      leading: controller.snpshotData['imgeUrl'] == ''
                          ? Image.asset(
                              imgProducts,
                              width: 50,
                              fit: BoxFit.cover,
                            ).box.roundedFull.clip(Clip.antiAlias).make()
                          : Image.network(
                              controller.snpshotData['imgeUrl'],
                              width: 50,
                            ).box.roundedFull.clip(Clip.antiAlias).make(),
                      // leading: Image.asset(imgProducts)
                      //     .box
                      //     .roundedFull
                      //     .clip(Clip.antiAlias)
                      //     .make(),
                      //  title: boldText(text: "${controller.snpshotData['vendor_name']}"),
                      // subtitle: normalText(text: "${controller.snpshotData['email']}"),
                      title: boldText(text: "eMart"),
                      subtitle: normalText(text: "vendor1@emart.com"),
                    ),
                    Divider(),
                    10.heightBox,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: List.generate(
                            profileButtonIcons.length,
                            (index) => ListTile(
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
                                  leading: Icon(
                                    profileButtonIcons[index],
                                    color: white,
                                  ),
                                  title: normalText(
                                      text: profileButtonTiltle[index]),
                                )),
                      ),
                    )
                  ],
                );
              }
            }));
  }
}
