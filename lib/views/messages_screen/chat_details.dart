import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';

Widget chatDetails() {
  return Directionality(
    textDirection:  TextDirection.ltr ,
    child: Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          normalText(text: 'Your message here....'),
          10.heightBox,
          normalText(text: '10.45PM')
        ],
      ),
    ),
  );
}