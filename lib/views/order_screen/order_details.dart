import 'package:ecommerce_seller/const/colors.dart';
import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/our_button.dart';
import 'package:ecommerce_seller/views/order_screen/order_placed_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

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
        title: boldText(text: 'Order details', size: 16.0, color: fontGrey),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child: ourButton(
          color: green,
          onPress: () {},
          title: 'Confirm Order',
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Visibility(
                // visible: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldText(text: 'Order Status',color: purpleColor,size: 16.0),
                     SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: boldText(text: 'placed', color: fontGrey),
                    ),
                     SwitchListTile(
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: 'Confirmed', color: fontGrey),
                    ),
                     SwitchListTile(
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: 'on Delivery', color: fontGrey),
                    ),
                     SwitchListTile(
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: 'Delivery', color: fontGrey),
                    )
                  ],
                )
                    .box.padding(EdgeInsets.all(18.0))
                    .outerShadowMd
                    .white
                    .border(color: lightGrey)
                    .roundedSM
                    .make(),
              ),

              //order
              Column(
                children: [
                  orderPlacedDetails(
                      d1: "data['order_code ']",
                      d2: "data['shipng_method']",
                      title1: "Order Code",
                      title2: "Shiping Method"),
                  orderPlacedDetails(
                      d1: DateTime.now(),
                      d2: "data['payment_method']",
                      title1: 'Order Date',
                      title2: "Payment Method"),
                  orderPlacedDetails(
                      d1: "Unpaid",
                      d2: "Order Placed",
                      title1: 'Payment Status',
                      title2: "Delivery Status"),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            boldText(
                                text: "Shiping Address", color: purpleColor),
                            "{data['order_by_name']".text.make(),
                            "{data['order_by_email']}".text.make(),
                            "{data['order_by_address']}".text.make(),
                            "{data['order_by_city']}".text.make(),
                            "{data['order_by_state']}".text.make(),
                            "{data['order_by_phone']}".text.make(),
                          ],
                        ),
                        SizedBox(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldText(
                                  text: 'Total Amount', color: purpleColor),
                              boldText(text: '\$300.0', color: red, size: 16.0),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
                  .box
                  .outerShadowMd
                  .white
                  .border(color: lightGrey)
                  .roundedSM
                  .make(),
              Divider(),
              10.heightBox,
              boldText(text: 'Order Products', color: fontGrey, size: 16.0),
              10.heightBox,
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(3, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orderPlacedDetails(
                        title1: "data['orders'][index]['title']",
                        title2: "data['orders'][index]['tprice']",
                        d1: "{data['orders'][index]['qty']}",
                        d2: "Refundaable",
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                            width: 30, height: 10, color: purpleColor),
                      ),
                      Divider()
                    ],
                  );
                }).toList(),
              )
                  .box
                  .outerShadowMd
                  .white
                  .margin(EdgeInsets.only(bottom: 4))
                  .make(),
              10.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
