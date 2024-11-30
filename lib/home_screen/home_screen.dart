import 'package:ecommerce_seller/const/colors.dart';
import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/const/strings.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/dashboad.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: boldText(text: dashboard, color: darkGrey, size: 18.0),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context,
                    title: products, count: 60, icon: icProducts),
                dashboardButton(context,
                    title: orders, count: 60, icon: icOrders)
              ],
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context,
                    title: rating, count: 60, icon: icStar),
                dashboardButton(context,
                    title: totalSales, count: 60, icon: icShop_setting)
              ],
            ),
             10.heightBox,
            Divider(),
            10.heightBox,
            boldText(text: popular, color: darkGrey, size: 16.0),
            10.heightBox,
            ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                  3,
                  (index) => ListTile(
                    onTap: (){},
                        leading: Image.asset(imgProducts,height: 90.0,width: 90.0,
                             fit: BoxFit.cover),
                             title: boldText(text: 'products title',color: fontGrey),
                             subtitle: normalText(text: "\$40.0",color: darkGrey),
                            
                      )),
            ),
            // boldText(text: 'dfgxxb',color: purpleColor)
            
          ],
        ),
      ),
    );
  }
}
