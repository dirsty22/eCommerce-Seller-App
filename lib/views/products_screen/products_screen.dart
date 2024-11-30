import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {},
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
                20,
                (index) => ListTile(
                      onTap: () {},
                      leading: Image.asset(imgProducts,
                          height: 90.0, width: 90.0, fit: BoxFit.cover),
                      title: boldText(text: 'products title', color: fontGrey),
                      subtitle: normalText(text: "\$40.0", color: darkGrey),
                      trailing: VxPopupMenu(
                          child: Icon(Icons.more_vert_rounded),
                          menuBuilder: () => Column(
                                children: List.generate(
                                    popupMenuTiltle.length,
                                    (index) => SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                              children: [
                                                Icon(popupMenuList[index]),
                                                10.widthBox,
                                                normalText(
                                                    text: popupMenuTiltle[index],
                                                    color: darkGrey)
                                              ],
                                            ),
                                      ),
                                    )
                                    ),
                              ).box.white.rounded.width(190).make(),
                          clickType: VxClickType.singleClick),
                    )),
          ),
        ),
      ),
    );
  }
}
