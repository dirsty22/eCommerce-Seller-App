import 'package:ecommerce_seller/const/colors.dart';
import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/controller/orders_controller.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/our_button.dart';
import 'package:ecommerce_seller/views/order_screen/order_placed_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetails extends StatefulWidget {
  final dynamic data;
  const OrderDetails({super.key, this.data});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  var controller = Get.find<ordersController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getOrders(widget.data);
    controller.confirmed.value=widget.data['order_confirmed'];
    controller.ondelivery.value=widget.data['order_on_delivery'];
    controller.delivered.value=widget.data['order_delivered'];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
        bottomNavigationBar: Visibility(
          visible: !controller.confirmed.value,
          child: SizedBox(
            height: 60,
            width: context.screenWidth,
            child: ourButton(
              color: green,
              onPress: () {
                controller.confirmed(true);
                controller.changeStatus(title: 'order_confirmed', status: true,docsID: widget.data.id);
              },
              title: 'Confirm Order',
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Visibility(
                  visible: controller.confirmed.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boldText(
                          text: 'Order Status', color: purpleColor, size: 16.0),
                      SwitchListTile(
                        activeColor: green,
                        value: true,
                        onChanged: (value) {},
                        title: boldText(text: 'placed', color: fontGrey),
                      ),
                      SwitchListTile(
                        activeColor: green,
                        value: controller.confirmed.value,
                        onChanged: (value) {
                          controller.confirmed.value=value;
                        },
                        title: boldText(text: 'Confirmed', color: fontGrey),
                      ),
                      SwitchListTile(
                        activeColor: green,
                        value: controller.ondelivery.value,
                        onChanged: (value) {
                          controller.ondelivery.value=value;
                           controller.changeStatus(title: 'order_on_delivery', status: value,docsID: widget.data.id);
                        },
                        title: boldText(text: 'on Delivery', color: fontGrey),
                      ),
                      SwitchListTile(
                        activeColor: green,
                        value:controller.delivered.value,
                        onChanged: (value) {
                          controller.delivered.value=value;
                           controller.changeStatus(title: 'order_delivered', status: value,docsID: widget.data.id);
                        },
                        title: boldText(text: 'Delivery', color: fontGrey),
                      )
                    ],
                  )
                      .box
                      .padding(EdgeInsets.all(18.0))
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
                        d1: "${widget.data['order_code ']}",
                        d2: "${widget.data['shipng_method']}",
                        title1: "Order Code",
                        title2: "Shiping Method"),
                    orderPlacedDetails(
                        // d1: DateTime.now(),
                        d1: intl.DateFormat()
                            .add_yMd()
                            .format((widget.data['order_date'].toDate())),
                        d2: "${widget.data['payment_method']}",
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
                              "${widget.data['order_by_name']}".text.make(),
                              "${widget.data['order_by_email']}".text.make(),
                              "${widget.data['order_by_address']}".text.make(),
                              "${widget.data['order_by_city']}".text.make(),
                              "${widget.data['order_by_state']}".text.make(),
                              "${widget.data['order_by_phone']}".text.make(),
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
                                boldText(
                                    text: '\$${widget.data['total_amount']}',
                                    color: red,
                                    size: 16.0),
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
                  children: List.generate(controller.orders.length, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderPlacedDetails(
                          title1: "${controller.orders[index]['title']}",
                          title2: "${controller.orders[index]['tprice']}",
                          d1: "${controller.orders[index]['qty']}",
                          d2: "Refundaable",
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                              width: 30,
                              height: 10,
                              color: Color(controller.orders[index]['color'])),
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
      ),
    );
  }
}
