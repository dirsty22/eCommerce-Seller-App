import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_seller/const/const.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ordersController extends GetxController{
 var orders = [];

 var confirmed= false.obs;
 var ondelivery =false.obs;
 var delivered= false.obs;

  getOrders(data){
    orders.clear();
    for(var item in data['orders'] ){
      if(item['vendor_id'] == currentUser!.uid){
        orders.add(item);
      }
    }
  }
  changeStatus({title,status,docsID}) async{
    var store = firestore.collection(ordersCollection).doc(docsID);
    await store.set({
      title:status

    },SetOptions(merge: true));
  }
  
}