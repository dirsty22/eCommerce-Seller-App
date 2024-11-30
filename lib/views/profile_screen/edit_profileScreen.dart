import 'package:ecommerce_seller/const/colors.dart';
import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/const/strings.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/custom_textfild.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: editProfile, size: 16.0),
        actions: [
          TextButton(onPressed: () {}, child: normalText(text: 'Save'))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              imgProducts,
              width: 150,
            ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: white),
                onPressed: () {},
                child: normalText(text: 'Change Image', color: fontGrey)),
            10.heightBox,
            Divider(
              color: white,
            ),
            customTextField(label: name,hint: ''),
            10.heightBox,
            customTextField(label: password,hint: passwordHint),
            10.heightBox,
            customTextField(label: confirmPass, hint: passwordHint),

          ],
        ),
      ),
    );
  }
}
