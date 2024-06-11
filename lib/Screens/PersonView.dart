import 'package:animate_do/animate_do.dart';
import 'package:smart_agriculture_monitoring/Screens/LoginScreen.dart';
import 'package:smart_agriculture_monitoring/ViewModel/Profile_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_agriculture_monitoring/core/Font.dart';
import 'package:smart_agriculture_monitoring/core/app_string.dart';
import 'package:smart_agriculture_monitoring/core/theme.dart';

class PersonView extends GetWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${AppStrings.appName}",
          style: getRegulerTextStyle(
            context: context,
            color: Colors.white,
          ),
        ),
      ),
      body: GetBuilder<ProfileViewModel>(
          init: Get.put(
            ProfileViewModel(),
          ),
          initState: (state) => controller.getCurrentUser(),
          builder: (controller) {
            return Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeOut(
                    child: Expanded(
                      child: ContainerToShowDaetilasUserModel(
                        controller: controller,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class ContainerToShowDaetilasUserModel extends StatelessWidget {
  const ContainerToShowDaetilasUserModel({
    super.key,
    required this.controller,
  });
  final controller;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            30,
          ),
          color: MaterialTheme.lightMediumContrastScheme().primary.withOpacity(
                .8,
              ),
        ),
        padding: EdgeInsets.all(10),
        height: MediaQuery.sizeOf(context).height * .75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FadeInRightBig(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.sizeOf(context).height * .07,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        MaterialTheme.lightMediumContrastScheme().primary,
                        MaterialTheme.lightMediumContrastScheme()
                            .primary
                            .withOpacity(0.9),
                        MaterialTheme.lightMediumContrastScheme()
                            .primary
                            .withOpacity(0.7),
                        MaterialTheme.lightMediumContrastScheme()
                            .primary
                            .withOpacity(0.5),
                        MaterialTheme.lightMediumContrastScheme()
                            .primary
                            .withOpacity(0.3),
                        MaterialTheme.lightMediumContrastScheme()
                            .primary
                            .withOpacity(0.1),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Name: ",
                        style: getBoldTextStyle(
                          color: Colors.white,
                          context: context,
                        ),
                      ),
                      Text(
                        "${controller.userModel.name}",
                        style: getLightTextStyle(
                          color: Colors.white,
                          context: context,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FadeInLeft(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.sizeOf(context).height * .07,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        MaterialTheme.lightMediumContrastScheme().primary,
                        MaterialTheme.lightMediumContrastScheme()
                            .primary
                            .withOpacity(0.9),
                        MaterialTheme.lightMediumContrastScheme()
                            .primary
                            .withOpacity(0.7),
                        MaterialTheme.lightMediumContrastScheme()
                            .primary
                            .withOpacity(0.5),
                        MaterialTheme.lightMediumContrastScheme()
                            .primary
                            .withOpacity(0.3),
                        MaterialTheme.lightMediumContrastScheme()
                            .primary
                            .withOpacity(0.1),
                      ],
                    ),
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "E-mail: ",
                        style: getBoldTextStyle(
                          color: Colors.white,
                          context: context,
                        ),
                      ),
                      Text(
                        "${controller.userModel.email}",
                        style: getRegulerTextStyle(
                          color: Colors.white,
                          context: context,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FadeInRightBig(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.sizeOf(context).height * .07,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        MaterialTheme.lightMediumContrastScheme().primary,
                        MaterialTheme.lightMediumContrastScheme()
                            .primary
                            .withOpacity(0.9),
                        MaterialTheme.lightMediumContrastScheme()
                            .primary
                            .withOpacity(0.7),
                        MaterialTheme.lightMediumContrastScheme()
                            .primary
                            .withOpacity(0.5),
                        MaterialTheme.lightMediumContrastScheme()
                            .primary
                            .withOpacity(0.3),
                        MaterialTheme.lightMediumContrastScheme()
                            .primary
                            .withOpacity(0.1),
                      ],
                    ),
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "UserId: ",
                        style: getBoldTextStyle(
                          color: Colors.white,
                          context: context,
                        ),
                      ),
                      Text(
                        "${controller.userModel.userId}",
                        style: getLightTextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          context: context,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButtonsignOut(
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}

class ElevatedButtonsignOut extends StatelessWidget {
  const ElevatedButtonsignOut({
    super.key,
    required this.controller,
  });
  final controller;
  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
      child: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            MaterialTheme.lightMediumContrastScheme().primary.withOpacity(.8),
          ),
          minimumSize: MaterialStatePropertyAll<Size>(
            Size(
              MediaQuery.sizeOf(context).width * .85,
              MediaQuery.sizeOf(context).height * .06,
            ),
          ),
        ),
        onPressed: () {
          controller.signOut();

          Get.offAll(
            LoginView(),
          );
        },
        icon: Icon(
          Icons.sign_language_outlined,
          color: Colors.white,
        ),
        label: Text(
          "signOut",
          style: getMediumTextStyle(
            color: Colors.white,
            context: context,
          ),
        ),
      ),
    );
  }
}
