import 'package:ecommerce_seller/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Authcontroller extends GetxController {
  var isloading = false.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      print('-_-  ${emailController.text}  ${passwordController.text}');
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

    } on FirebaseException catch (e) {
       print('-_-  ${e.toString()}');
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  SignoutMethod({context}) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
