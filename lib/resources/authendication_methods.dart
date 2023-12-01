//import 'package:amazon_clone/screens/sign_uppage.dart';
import 'package:amazon_clone/model/user_details_model.dart';
import 'package:amazon_clone/resources/cloudfirestoree_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';

class AuthenticationMethod {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  cloudfirestoreClass cloudfirestoreclass = cloudfirestoreClass();
  Future<String> SignUpScreen(
      {required String name,
      required String address,
      required String email,
      required String password}) async {
    name.trim();
    address.trim();
    email.trim();
    password.trim();

    String output = "something went wrong";
    if (name != "" && address != "" && email != "" && password != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        UserDetailsModel user = UserDetailsModel(name: name, address: address);
        await cloudfirestoreclass.UploadNameAndAddressToDatabase(user: user);

        output = "succes";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "please fill up all the feilds.";
    }
    return output;
  }

  Future<String> SigninScreen(
      {required String email, required String password}) async {
    email.trim();
    password.trim();

    String output = "something went wrong";
    if (email != "" && password != "") {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        output = "succes";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "please fill up all the feilds.";
    }
    return output;
  }
}
