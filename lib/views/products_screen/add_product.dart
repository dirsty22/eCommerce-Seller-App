import 'package:ecommerce_seller/const/colors.dart';
import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/custom_textfild.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:ecommerce_seller/views/components/product_drop_down.dart';
import 'package:ecommerce_seller/views/components/products_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          TextButton(
              onPressed: () {},
              child: boldText(text: 'Save', color: white, size: 14.0))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              customTextField(hint: 'Laptop', label: 'Product Name'),
              10.heightBox,
              customTextField(hint: 'Lnice Prduct', label: 'Description'),
              10.heightBox,
              customTextField(hint: '\$100', label: 'Price'),
              10.heightBox,
              customTextField(hint: '20', label: 'Qunatity'),
              10.heightBox,
              producDropDown(),
              10.heightBox,
              producDropDown(),
              10.heightBox,
              normalText(text: 'Choose Product images'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(3, (index) => productImages(label: '${index+1}')),
              ),
              20.heightBox,
              boldText(text: 'Choose Color'),
              10.heightBox,
              Wrap(
                spacing: 5.0,
                runSpacing: 5.0,
                children: List.generate(9, (index) =>Stack(
                  alignment: Alignment.center,
                  children: [
                    VxBox(
                      child: normalText(text: index)
                              
                    ).color(Vx.randomPrimaryColor).roundedFull.size(50, 50).make(),
                    Icon(Icons.done,color: white,)
                  ],
                ),
                
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
