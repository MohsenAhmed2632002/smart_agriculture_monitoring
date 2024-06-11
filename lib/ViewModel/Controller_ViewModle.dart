import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_agriculture_monitoring/Screens/Home_Viwe.dart';
import 'package:smart_agriculture_monitoring/Screens/order_View.dart';
import 'package:smart_agriculture_monitoring/screens/PersonView.dart';

class ControllerViewModel extends GetxController {
  int _navValue = 0;
  get navValue => _navValue;
  Widget _currentScreen = HomeView();
  get currentScreen => _currentScreen;
  void getNavValue(int selectIndex) {
    _navValue = selectIndex;
    switch (selectIndex) {
      case 0:
        _currentScreen = HomeView();
        break;
      case 1:
        _currentScreen = OrderView();
        break;
      case 2:
        _currentScreen = PersonView();
        break;
      default:
    }
    update();
  }
}
