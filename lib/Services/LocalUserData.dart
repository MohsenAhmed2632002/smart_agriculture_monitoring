
// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:smart_agriculture_monitoring/Model/UserModel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalUserData extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    dynamic value = preferences.get("UserData");
    return UserModel.fromJson(jsonDecode(value));
  }

  setuserData(UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("UserData", jsonEncode(userModel.toJson()));
  }

  deleteUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
