import 'package:ecommerce_seller/const/colors.dart';
import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/controller/product_contoller.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/custom_textfild.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:ecommerce_seller/views/components/loading_indicator.dart';
import 'package:ecommerce_seller/views/components/product_drop_down.dart';
import 'package:ecommerce_seller/views/components/products_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<productController>();
    return Obx(
      () => Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: darkGrey,
              )),
          backgroundColor: white,
          title: boldText(text: ' Add Product', size: 16.0, color: fontGrey),
          actions: [
           controller.isloading.value ? loadingIndicator() : TextButton(
                onPressed: () async {
                  controller.isloading(true);
                  await controller.uploadImages();
                  await controller.uploadProduct(context);
                  Get.back();
                },
                child: boldText(text: 'Save', color: fontGrey, size: 14.0))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                customTextField(
                    hint: '',
                    label: 'Product Name',
                    controller: controller.pnameController),
                10.heightBox,
                customTextField(
                    hint: '',
                    label: 'Description',
                    controller: controller.pdescController),
                10.heightBox,
                customTextField(
                    hint: '\$',
                    label: 'Price',
                    controller: controller.ppriceController),
                10.heightBox,
                customTextField(
                    hint: '',
                    label: 'Qunatity',
                    controller: controller.pquantityController),
                10.heightBox,
                producDropDown("Category", controller.categoryList,
                    controller.categoryvalue, controller),
                10.heightBox,
                producDropDown("Subcategory", controller.subcategoryList,
                    controller.subcategoryvalue, controller),
                10.heightBox,
                normalText(text: 'Choose Product images'),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        3,
                        (index) => controller.pImagesList[index] != null
                            ? Image.file(
                                controller.pImagesList[index],
                                width: 100,
                              ).onTap(() {
                                controller.pickImage(index, context);
                              })
                            : productImages(label: '${index + 1}').onTap(() {
                                controller.pickImage(index, context);
                              })),
                  ),
                ),
                20.heightBox,
                boldText(text: 'Choose Color'),
                10.heightBox,
                Obx(
                  () => Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: List.generate(
                      9,
                      (index) => Stack(
                        alignment: Alignment.center,
                        children: [
                          VxBox()
                              .color(Vx.randomPrimaryColor)
                              .roundedFull
                              .size(50, 50)
                              .make()
                              .onTap(() {
                            controller.selectColorIndex.value == index;
                          }),
                          controller.selectColorIndex.value == index
                              ? const Icon(
                                  Icons.done,
                                  color: white,
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
