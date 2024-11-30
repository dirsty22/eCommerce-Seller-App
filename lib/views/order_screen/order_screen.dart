import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: boldText(text: orders, color: darkGrey, size: 18.0),
        actions: [
          Center(
              child: boldText(
                  text: intl.DateFormat('EEE, MMM d, yyyy')
                      .format(DateTime.now()),
                  color: purpleColor)),
          10.widthBox
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
                  3,
                  (index) => ListTile(
                        onTap: () {},
                        tileColor: textfieldGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        title: boldText(text: '977746527', color: purpleColor),
                        subtitle: Column(
                          children: [
                           Row(
                            children: [
                              Icon(Icons.calendar_month,color: fontGrey,),
                              10.widthBox,
                               boldText(text: intl.DateFormat().add_yMd().format(DateTime.now()), color: fontGrey),
                            ],
                           ),

                           Row(
                            children: [
                              Icon(Icons.payment,color: fontGrey,),
                              10.widthBox,
                               boldText(text: unpaid, color: fontGrey),
                            ],
                           ),

                          ],
                        ),
                        trailing: boldText(text: "\$40.0",color: purpleColor,size: 16.0 ),
                      ).box.margin(EdgeInsets.only(bottom: 4)).make()
                      ),
          ),
        ),
      ),
    );
  }
}