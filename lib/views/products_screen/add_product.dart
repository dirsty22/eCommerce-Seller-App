import 'package:ecommerce_seller/const/colors.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/custom_textfild.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
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
          TextButton(onPressed: (){}, child: boldText(text: 'Save',color: white,size: 14.0))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            customTextField(hint: 'Laptop',
            label: 'Product Name')
          ],
        ),
      ),

    );
  }
}