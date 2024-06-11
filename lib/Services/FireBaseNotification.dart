import 'package:firebase_messaging/firebase_messaging.dart';

class FireBaseNotification  {
  final firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotification() async {
    await firebaseMessaging.requestPermission();
    String? _token = await firebaseMessaging.getToken();
    print("the Token:${_token}");
    // firebaseMessaging.;
  }
}
