import 'package:ecommerce_seller/const/const.dart';
import 'package:ecommerce_seller/controller/home_controller.dart';
import 'package:ecommerce_seller/home_screen/home_screen.dart';
import 'package:ecommerce_seller/views/order_screen/order_screen.dart';
import 'package:ecommerce_seller/views/products_screen/products_screen.dart';
import 'package:ecommerce_seller/views/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navScreen =[
      HomeScreen(),
      ProductScreen(),
      OrderScreen(),
      ProfileScreen()
      
      

    ];

    var bottomNavber = [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: dashboard),
      BottomNavigationBarItem(icon: Image.asset(icProducts,color: darkGrey,width: 24,),label: products),
      BottomNavigationBarItem(icon: Image.asset(icOrders,color: darkGrey,width: 24),label: orders),
      BottomNavigationBarItem(icon: Image.asset(icGeneral_setting,color: darkGrey,width: 24),label: settings),
    ];
    return Scaffold(
      bottomNavigationBar: Obx(()=>
       BottomNavigationBar(items: bottomNavber,
        selectedItemColor: purpleColor,
        unselectedItemColor: darkGrey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          controller.navIndex.value = index;
        
          
        },
        currentIndex: controller.navIndex.value,
        ),
      ),
      body: Obx(() =>
         Column(
          children: [
            Expanded(child: navScreen.elementAt(controller.navIndex.value)
        
        
            )
        
          ],
        ),
      ),
    );
  }
}
