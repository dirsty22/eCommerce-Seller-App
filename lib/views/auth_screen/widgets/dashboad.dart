import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/views/auth_screen/widgets/normal_text.dart';

Widget dashboardButton(context, {title , count , icon})
{
  var size= MediaQuery.of(context).size;
  return Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      boldText(text: title,size: 16.0,color: white),
                      boldText(text: count,size: 20.0,color: white),
                    ],
                    
                  ),
                ),
                Image.asset(icon,width: 40,color: white,)
              ],
            ).box.rounded.color(purpleColor).size(size.width*0.4, 80).padding(EdgeInsets.all(8)).make();
}