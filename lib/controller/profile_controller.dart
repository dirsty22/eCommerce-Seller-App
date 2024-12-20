import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_seller/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  late QueryDocumentSnapshot snpshotData;
  var profileImgPath = ''.obs;
  var profileImageLink = '';
  var isloading = false.obs;

  var nameController = TextEditingController();
  var oldpassController = TextEditingController();
  var newpassController = TextEditingController();

  var shopNameController = TextEditingController();
  var shopAddressController = TextEditingController();
  var shopMoblieController = TextEditingController();
  var shopWebsiteController = TextEditingController();
  var shopDescController = TextEditingController();
  // BuildContext get context => null;

  changeImage(context) async {
    final img = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 70);
    try {
      if (img == null) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    var filename = basename(profileImgPath.value);
    var destination = 'image/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImgPath.value));
    profileImageLink = await ref.getDownloadURL();
  }

  updateprofile({name, password, imgUrl}) async {
    var store = firestore.collection(vendorCollection).doc(currentUser!.uid);
    await store.set(
        {'vendor_name': name, 'password': password, 'imgeUrl': imgUrl},
        SetOptions(merge: true));

    isloading(false);
  }

  changeAuthPassword({email, password, newpassword}) async {
    final cred = EmailAuthProvider.credential(email: email, password: password);

    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newpassword);
    }).catchError((error) {
      print(error.toString());
    });
  }

  updateShop({shopname, shopaddress, shopmobile, shopwebsite, shopdesc}) async {
    var store = firestore.collection(vendorCollection).doc(currentUser!.uid);
    await store.set({'shop_name': shopname, 
    'shop_address': shopaddress,
    'shop_mobile': shopmobile,
    'shop_website': shopwebsite,
    'shop_desc':shopdesc
    },
        SetOptions(merge: true));

    isloading(false);
  }
}
