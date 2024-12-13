import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/services/stor_sevices.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:ecommerce_seller/views/components/loading_indicator.dart';
import 'package:ecommerce_seller/views/products_screen/add_product.dart';
import 'package:ecommerce_seller/views/products_screen/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart' as intl;

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {
          Get.to(() => AddProduct());
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: boldText(text: products, color: darkGrey, size: 18.0),
        actions: [
          Center(
              child: boldText(
                  text: intl.DateFormat('EEE, MMM d, yyyy')
                      .format(DateTime.now()),
                  color: purpleColor)),
          10.widthBox
        ],
      ),

      body: StreamBuilder(
          stream: StoreServices.getProduct(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loadingIndicator();
            } else {
              var data = snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(
                        data.length,
                        (index) => ListTile(
                              onTap: () {
                                Get.to(() => ProducDetails(data: data[index],));
                              },
                              leading: Image.network(data[index]['p_img'][0],
                                  height: 100, width: 100, fit: BoxFit.cover),
                              title: boldText(
                                  text: '${data[index]['p_name']}', color: fontGrey),
                              subtitle: Row(
                                children: [
                                  normalText(text: "\$${data[index]['p_price']}", color: darkGrey),
                                  10.widthBox,
                                 boldText(text: data[index]['is_featured']==true ? 'Featired' : '', color: green)
                                ],
                              ),
                              trailing: VxPopupMenu(
                                  child: Icon(Icons.more_vert_rounded),
                                  menuBuilder: () => Column(
                                        children: List.generate(
                                            popupMenuTiltle.length,
                                            (index) => SizedBox(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(popupMenuList[
                                                            index]),
                                                        10.widthBox,
                                                        normalText(
                                                            text:
                                                                popupMenuTiltle[
                                                                    index],
                                                            color: darkGrey)
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                      ).box.white.rounded.width(190).make(),
                                  clickType: VxClickType.singleClick),
                            )),
                  ),
                ),
              );
            }
          }),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: SingleChildScrollView(
      //     physics: BouncingScrollPhysics(),
      //     child: Column(
      //       children: List.generate(
      //           20,
      //           (index) => ListTile(
      //                 onTap: () {
      //                   Get.to(()=> ProducDetails());
      //                 },
      //                 leading: Image.asset(imgProducts,
      //                     height: 90.0, width: 90.0, fit: BoxFit.cover),
      //                 title: boldText(text: 'products title', color: fontGrey),
      //                 subtitle: Row(
      //                   children: [
      //                     normalText(text: "\$40.0", color: darkGrey),
      //                     10.widthBox,
      //                     boldText(text: 'Featired',color: green)
      //                   ],
      //                 ),
      //                 trailing: VxPopupMenu(
      //                     child: Icon(Icons.more_vert_rounded),
      //                     menuBuilder: () => Column(
      //                           children: List.generate(
      //                               popupMenuTiltle.length,
      //                               (index) => SizedBox(
      //                                 child: Padding(
      //                                   padding: const EdgeInsets.all(12.0),
      //                                   child: Row(
      //                                         children: [
      //                                           Icon(popupMenuList[index]),
      //                                           10.widthBox,
      //                                           normalText(
      //                                               text: popupMenuTiltle[index],
      //                                               color: darkGrey)
      //                                         ],
      //                                       ),
      //                                 ),
      //                               )
      //                               ),
      //                         ).box.white.rounded.width(190).make(),
      //                     clickType: VxClickType.singleClick),
      //               )),
      //     ),
      //   ),
      // ),
    );
  }
}
