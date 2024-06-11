import 'package:firebase_database/firebase_database.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderViewModel extends GetxController {
  final DatabaseReference database = FirebaseDatabase.instance.ref();
  bool relayState = false;
  double temperature = 0.0;
  double humidity = 0.0;
  double soilMoisture = 0;

  @override
  void initState() {
    database.child('relayControl').onValue.listen((event) {
      relayState = event.snapshot.value == 1;
      update();
    });
    database.child('sensorData').onValue.listen((event) {
      var data = event.snapshot.value as Map<String, dynamic>?;

      temperature = data!['temperature'];
      humidity = data['humidity'];
      soilMoisture = data['soilMoisture'];
      update();
    });
  }

  void toggleRelay(bool value) {
    database.child('relayControl').set(value ? 1 : 0);
    relayState = value;
    update();
  }

  final Uri _url = Uri.parse(
      'https://docs.google.com/forms/d/e/1FAIpQLScxgtPAmKsdBKsbW5ZXOHR9vwBLQMlq403HcHgTER-juIStww/viewform?usp=sf_link');
  Future<void> mylaunchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
