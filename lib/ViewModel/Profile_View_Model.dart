import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_agriculture_monitoring/Model/UserModel.dart';
import 'package:smart_agriculture_monitoring/Services/LocalUserData.dart';

class ProfileViewModel extends GetxController {
  final LocalUserData localUserData = Get.find();
  UserModel get userModel => _userModel;
  UserModel _userModel = UserModel(
    email: "",
    name: "",
    userId: "",
  ); // تهيئة _userModel بقيمة افتراضية null

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  Future signOut() async {
    // GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localUserData.deleteUser();
  }

  Future<void> getCurrentUser() async {
    var user = await localUserData.getUser;
    if (user != null) {
      _userModel = user;
    } else {
      // إدراج رد فعل أو تصرف بديل حسب الحاجة عندما تكون القيمة مساوية لـ null
      _userModel = UserModel(name: "name", email: "email", userId: "userId",);
    }

    // _userModel = (await localUserData.getUser)  !;
    update();
  }
}
