import 'package:ecommerce_seller/const/const.dart';

class StoreServices {
  static getProfile(uid) {
    return firestore
        .collection(vendorCollection)
        .where('id', isEqualTo: uid)
        .get();
  }

  static getMessages(uid) {
    return firestore
        .collection(chatCollection)
        .where('toId', isEqualTo: uid)
        .snapshots();
  }

  static getOrders(uid) {
    // return firestore.collection(ordersCollection).where('vendor_id',arrayContains: uid).snapshots();
    // print("--------");
    // print("----uid ${uid}");
    // print("--------");

    return firestore
        .collection(ordersCollection)
        .where('vendors', arrayContains: uid)
        .snapshots();
  }

  static getProduct(uid){
    return firestore.collection(producsCollection).where('vendor_id',isEqualTo: uid).snapshots();
  }

 


}
