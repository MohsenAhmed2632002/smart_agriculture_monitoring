import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_agriculture_monitoring/Model/UserModel.dart';
import 'package:smart_agriculture_monitoring/Services/FireStore.dart';
import 'package:smart_agriculture_monitoring/Services/LocalUserData.dart';
import 'package:smart_agriculture_monitoring/ViewModel/ControllerView.dart';

class AuthViewModel extends GetxController {
  final LocalUserData localUserData = Get.find();

  FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String name;

  Rx<User?> _user = Rx<User?>(null);
  String? get user => _user.value?.email;
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        await FireSoterUser().getCurrentUser(value.user!.uid).then((value) =>
            setUser(UserModel.fromJson(value.data() as Map<String, dynamic>)));
      });
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        animationDuration: Duration(seconds: 2),
        title: email.toString(),
        message: password.toString(),
      ));
      Get.offAll(ControllerView());
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
        animationDuration: Duration(seconds: 2),
        title: e.toString(),
        message: e.toString(),
      ),);
      // print(e);
    }
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((myUser) async {
        await saveUser(myUser);
      });
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
          animationDuration: Duration(seconds: 2),
          title: email.toString(),
          message: password.toString(),
        ),
      );
      Get.offAll(ControllerView());
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        animationDuration: Duration(seconds: 2),
        title: e.toString(),
        message: e.toString(),
      ));
    }
  }

  Future<void> saveUser(UserCredential myUser) async {
    UserModel userModel = UserModel(
      name: name,
      email: myUser.user!.email!,
      userId: myUser.user!.uid,
    );
    await FireSoterUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  Future setUser(UserModel userModel) async {
    await localUserData.setuserData(userModel);
  }
}
