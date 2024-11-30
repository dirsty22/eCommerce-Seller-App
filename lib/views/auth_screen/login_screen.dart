import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/home_screen/home.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              30.heightBox,
              normalText(text: welcome, size: 18.0),
              Row(
                children: [
                  Image.asset(
                    icLogo,
                    height: 80,
                    width: 80,
                  )
                      .box
                      .border(color: white)
                      .rounded
                      .padding(EdgeInsets.all(8))
                      .make(),
                      10.widthBox,
                      boldText(text: appname,size: 18.0)

                ],
              ),
              30.heightBox,
              normalText(text: loginTo,size: 18.0,color: darkGrey),
              10.heightBox,
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: textfieldGrey,
                      filled: true,
                      prefixIcon: Icon(Icons.email,color: purpleColor,),
                      border: InputBorder.none,
                      hintText: emailHint,
                    ),
                  ),10.heightBox,
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: textfieldGrey,
                      filled: true,
                      prefixIcon: Icon(Icons.lock,color: purpleColor,),
                      border: InputBorder.none,
                      hintText: passwordHint,
                    ),
                  ),
                  20.heightBox,
                  Align(alignment: Alignment.centerRight,
                    child: TextButton(onPressed: () {}, child: normalText(text: forgotPassword,color: purpleColor))),
                  10.heightBox,
                  SizedBox(
                    width:context.screenWidth-150  ,
                    child: ourButton(
                      title: login,
                      onPress: () {
                        // print("fhgfj");
                        // Get.back();
                        Get.to(() => const Home());
                      },
                    ),
                  )

                ],

              ).box.white.rounded.padding(EdgeInsets.all(8)).make(),
              10.heightBox,
              // Center(child: normalText(text: anyProblem))
            ],
          ),
        ),
      ),
    );
  }
}
