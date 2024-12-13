import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';

Widget producDropDown() {
  return DropdownButtonHideUnderline(
    child: DropdownButton<String>(
      hint: normalText(text: 'Chose category',color: fontGrey),
      value: null,
      isExpanded: true,
      items: [], onChanged: (value) {}),
  ).box.white.padding(EdgeInsets.symmetric(horizontal: 4)).roundedSM.make();
}
