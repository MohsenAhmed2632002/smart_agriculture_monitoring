import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:smart_agriculture_monitoring/ViewModel/Auth_ViewModel.dart';
import 'package:smart_agriculture_monitoring/Screens/LoginScreen.dart';
import 'package:smart_agriculture_monitoring/ViewModel/Controller_ViewModle.dart';
import 'package:smart_agriculture_monitoring/Screens/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_agriculture_monitoring/core/Font.dart';

class ControllerView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        return snapshot.data == ConnectivityResult.none
            ? Scaffold(
                body: Center(
                  child: Text(
                    "No Internet Connection \n Please Check Your Internet \n Connection",
                    style: getBoldTextStyle(
                      context: context,
                      color: Colors.red,
                    ),
                  ),
                ),
              )
            : Obx(
                () {
                  return (Get.put(AuthViewModel()).user == null)
                      ? LoginView()
                      : GetBuilder<ControllerViewModel>(
                          init: Get.put(
                            ControllerViewModel(),
                          ),
                          builder: (controller) {
                            return HasSignedIn();
                          },
                        );
                },
              );
      },
    );
  }
}

class HasSignedIn extends StatelessWidget {
  const HasSignedIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerViewModel>(
      init: Get.put(ControllerViewModel()),
      builder: (controller) {
        return Scaffold(
          body: controller.currentScreen,
          bottomNavigationBar: MyNavigationBar(),
        );
      },
    );
  }
}
