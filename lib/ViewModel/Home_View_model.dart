import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
import 'package:smart_agriculture_monitoring/Services/Api.dart';
import 'package:smart_agriculture_monitoring/core/image.dart';

class HomeViewModel extends GetxController {
 

  final ApiService apiService = ApiService();

  Stream<Map<String, dynamic>> fetchData() async* {
    while (true) {
      final response = await apiService.get(
        Url:
            'https://api.thingspeak.com/channels/2538466/feeds.json?api_key=0HQJXLNTD4AGD2N3&results=2',
      );
      yield response;
      await Future.delayed(
        Duration(
          seconds: 1,
        ),
      ); // تأخير 10 ثواني قبل إعادة الاستدعاء
    }
  }
  // Future<Map<String, dynamic>> fetchData() async {
  // final response = await apiService.get(
  // Url:
  // 'https://api.thingspeak.com/channels/2538466/feeds.json?api_key=0HQJXLNTD4AGD2N3&results=2',
  // );
  // return response;
  // }

  void Notificationfield2() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 0,
            channelKey: 'smart_agriculture_monitoring',
            title: "Field 2 is more than 15",
            bigPicture: "${AssetsImage.imagelogo}",
            notificationLayout: NotificationLayout.BigPicture));
  }

  void Notificationfield1() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'smart_agriculture_monitoring',
            title: "Field 1 is more than 25",
            bigPicture: "${AssetsImage.imagelogo}",
            notificationLayout: NotificationLayout.BigPicture)
        // ,schedule: fetchData()["channel"]["field2"],

        );
  }
}
