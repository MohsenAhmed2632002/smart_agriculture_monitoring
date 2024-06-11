import 'package:get/get.dart';
import 'package:smart_agriculture_monitoring/Services/LocalUserData.dart';
import 'package:smart_agriculture_monitoring/ViewModel/Auth_ViewModel.dart';
import 'package:smart_agriculture_monitoring/ViewModel/Controller_ViewModle.dart';
import 'package:smart_agriculture_monitoring/ViewModel/Home_View_model.dart';
import 'package:smart_agriculture_monitoring/ViewModel/Profile_View_Model.dart';
import 'package:smart_agriculture_monitoring/ViewModel/order_View_View_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthViewModel(),
    );
    Get.lazyPut(
      () => OrderViewModel(),
    );

    Get.lazyPut(
      () => ControllerViewModel(),
    );
    Get.lazyPut(
      () => HomeViewModel(),
    );

    Get.lazyPut(
      () => LocalUserData(),
    );
    Get.lazyPut(
      () => ProfileViewModel(),
    );
//   //
//  Get.lazyPut(
//       () => FireBaseNotification(),
//     );
  }
}
