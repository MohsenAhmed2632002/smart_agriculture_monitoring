import 'package:flutter/material.dart';
import 'package:smart_agriculture_monitoring/ViewModel/Controller_ViewModle.dart';
import 'package:get/get.dart';
import 'package:smart_agriculture_monitoring/core/Font.dart';
import 'package:smart_agriculture_monitoring/core/theme.dart';

class MyNavigationBar extends GetWidget<ControllerViewModel> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerViewModel>(
      init: Get.find(),
      builder: (controller) {
        return Container(
          margin: EdgeInsets.all(
            20,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 25,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              25,
            ),
            child: BottomNavigationBar(
              selectedItemColor: Colors.white,
              showSelectedLabels: true,
              selectedLabelStyle: getLightTextStyle(
                context: context,
                color: Colors.white,
              ),
              unselectedLabelStyle: getLightTextStyle(
                context: context,
                color: Colors.black,
              ),
              showUnselectedLabels: false,
              backgroundColor: MaterialTheme.lightScheme().primary,
              onTap: (index) {
                controller.getNavValue(index);
              },
              currentIndex: controller.navValue,
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Order",
                  icon: Icon(
                    color: Colors.white,
                    Icons.arrow_outward_rounded,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: Icon(
                    color: Colors.white,
                    Icons.person,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
