import 'package:ecommerce_seller/const/colors.dart';
import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:ecommerce_seller/views/messages_screen/chat_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: boldText(text: 'Chat', size: 16.0, color: fontGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: ((context, index){
                    return chatDetails(
                      
                    );
                  }),
              // color: Colors.green,
            )),
            10.heightBox,
            SizedBox(
              height: 56,
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Enter message',
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: purpleColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: purpleColor))),
                  )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.send,
                        color: purpleColor,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
