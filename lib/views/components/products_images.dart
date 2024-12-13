import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';

Widget productImages({required label, onPress }) {
  return '$label'.text.bold.color(fontGrey).size(16.0).makeCentered().box.color(lightGrey).size(100,100).roundedSM.make();
}