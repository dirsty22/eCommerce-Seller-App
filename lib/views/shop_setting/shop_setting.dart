import 'package:ecommerce_seller/const/colors.dart';
import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/const/strings.dart';
import 'package:ecommerce_seller/controller/profile_controller.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/custom_textfild.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:ecommerce_seller/views/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ShopSetting extends StatelessWidget {
  const ShopSetting({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: white,
              )),
          title: boldText(text: shopSetting, size: 16.0),
          actions: [
            controller.isloading.value
                ? loadingIndicator(circleColor: white)
                : TextButton(
                    onPressed: () async {
                      controller.isloading(true);
                      await controller.updateShop(
                        shopname: controller.shopNameController.text,
                        shopaddress: controller.shopAddressController.text,
                        shopmobile: controller.shopMoblieController.text,
                        shopwebsite: controller.shopWebsiteController.text,
                        shopdesc: controller.shopDescController.text,
                      );
                    },
                    child: normalText(text: 'Save'))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              customTextField(
                label: 'Shop Name',
                hint: 'Vendor Name',
                controller: controller.shopNameController,
              ),
              10.heightBox,
              customTextField(
                  label: 'Shop Address',
                  hint: 'pabna Sodor',
                  controller: controller.shopAddressController),
              10.heightBox,
              customTextField(
                  label: 'Shop Mobile',
                  hint: '01738384332',
                  controller: controller.shopMoblieController),
              10.heightBox,
              customTextField(
                  label: 'Shop Website',
                  hint: 'vendor.ecommerce.com',
                  controller: controller.shopWebsiteController),
              10.heightBox,
              customTextField(
                  label: 'Description',
                  hint: 'Enter Your shop description',
                  controller: controller.shopDescController)
            ],
          ),
        ),
      ),
    );
  }
}
