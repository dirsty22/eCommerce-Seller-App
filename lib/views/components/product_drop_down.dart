import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/controller/product_contoller.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

Widget producDropDown(hint,List<String> List, drowpvalue, productController controller) {
  return Obx(() =>
     DropdownButtonHideUnderline(
      child: DropdownButton(
          hint: normalText(text: '$hint', color: fontGrey),
          value: drowpvalue.value == '' ? null : drowpvalue.value,
          isExpanded: true,
          items: List.map((e){
            return DropdownMenuItem(child: e.toString().text.make(),value: e,);
          }).toList(),
          onChanged: (newValue) {
            if(hint== 'Category'){
              controller.subcategoryvalue.value= '';
              controller.populateSubcategoryList(newValue.toString());
            }
            drowpvalue.value = newValue.toString();
          }),
    ).box.white.padding(EdgeInsets.symmetric(horizontal: 4)).roundedSM.make(),
  );
}
