import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/controller/auth_controller.dart';
import 'package:ecommerce_seller/home_screen/home.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/our_button.dart';
import 'package:ecommerce_seller/views/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Authcontroller());
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
                  boldText(text: appname, size: 18.0)
                ],
              ),
              30.heightBox,
              normalText(text: loginTo, size: 18.0, color: darkGrey),
              10.heightBox,
              Obx(
                () => Column(
                  children: [
                    TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        fillColor: textfieldGrey,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.email,
                          color: purpleColor,
                        ),
                        border: InputBorder.none,
                        hintText: emailHint,
                      ),
                    ),
                    10.heightBox,
                    TextFormField(
                      obscureText: true,
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        fillColor: textfieldGrey,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: purpleColor,
                        ),
                        border: InputBorder.none,
                        hintText: passwordHint,
                      ),
                    ),
                    20.heightBox,
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: normalText(
                                text: forgotPassword, color: purpleColor))),
                    10.heightBox,
                    SizedBox(
                      width: context.screenWidth - 100,
                      child: controller.isloading.value
                          ? loadingIndicator()
                          : ourButton(
                              title: login,
                              onPress: () async {
                                controller.isloading(true);
                                await controller
                                    .loginMethod(
                                  context: context,
                                )
                                    .then((value) {
                                  if (value != null) {
                                    VxToast.show(context, msg: "Logged in");
                                    controller.isloading(false);
                                    Get.offAll(() => Home());
                                  } else {
                                    controller.isloading(false);
                                  }
                                });
                              },
                            ),
                    )
                  ],
                ).box.white.rounded.padding(EdgeInsets.all(8)).make(),
              ),
              10.heightBox,
              // Center(child: normalText(text: anyProblem))
            ],
          ),
        ),
      ),
    );
  }
}
