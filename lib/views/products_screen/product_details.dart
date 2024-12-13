import 'package:ecommerce_seller/const/colors.dart';
import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProducDetails extends StatelessWidget {
  final dynamic data;
  const ProducDetails({super.key,this.data});

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
        title: boldText(text: '${data['p_name']}', size: 16.0, color: fontGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            VxSwiper.builder(
                autoPlay: true,
                height: 250,
                itemCount: data['p_img'].length,
                aspectRatio: 16 / 9,
                itemBuilder: (context, index) {
                  return Image.network(
                   data['p_img'][0],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                }),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  boldText(text: '${data['p_name']}', color: fontGrey, size: 16.0),
                  10.heightBox,
                  Row(
                    children: [
                      boldText(text: 'Category', color: fontGrey,size: 16.0),
                      10.widthBox,
                      normalText(text: 'Subcategory',color: fontGrey,size: 16.0)
                    ],
                  ),
                  10.heightBox,
                  VxRating(
                    value: 3.0,
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    maxRating: 5,
                    size: 25,
                    // stepInt: true,
                  ),
                  10.heightBox,
                  boldText(text: 'Price', color: red, size: 16.0),
                  10.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child:
                                  boldText(text: 'Color', color: fontGrey)),
                          Row(
                            children: List.generate(
                              3,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .roundedFull
                                  .color(Vx.randomPrimaryColor)
                                  .margin(EdgeInsets.symmetric(horizontal: 6))
                                  .make()
                                  .onTap(() {}),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: boldText(
                                  text: 'Quantity', color: fontGrey)),
                                  normalText(text: '20 items',color: fontGrey)
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),
                    ],
                  )
                ],
              ).box.white.padding(EdgeInsets.all(4)).shadowSm.make(),
              


            ),
            Divider(),
            10.heightBox,
            boldText(text: 'Description',color: fontGrey),
            10.heightBox,
            normalText(text: 'jbjhbinnk kojf',color: fontGrey)
          ]
          
          ),
        ),
      ),
    );
  }
}
