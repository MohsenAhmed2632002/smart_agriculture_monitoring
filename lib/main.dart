// ignore_for_file: unused_local_variable

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:smart_agriculture_monitoring/Services/FireBaseNotification.dart';
import 'package:smart_agriculture_monitoring/core/binding.dart';
import 'package:smart_agriculture_monitoring/firebase_options.dart';
import 'package:smart_agriculture_monitoring/splash_screen.dart';
import 'core/theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FireBaseNotification().initNotification();
  AwesomeNotifications().initialize(
    "resource://drawable/logo",
    [
      NotificationChannel(
        channelKey: "smart_agriculture_monitoring",
        channelName: "channelName",
        channelDescription: "channelDescription",
        playSound: true,
        channelShowBadge: true,
      ),
    ],
    debug: true,
  );
  AwesomeNotifications().isNotificationAllowed().then(
    (isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    },
  );

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    MaterialTheme theme = MaterialTheme();
    return GetMaterialApp(
      initialBinding: Binding(),
      theme: theme.light(),
      home: SplashView(),
//
      //  home: SensorDataScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    // MaterialTheme theme = MaterialTheme();
    return MaterialApp(
      // initialBinding: Binding(),
      // theme: theme.light(),
      // home: SplashView(),

      home: MonitorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MonitorScreen extends StatefulWidget {
  @override
  _MonitorScreenState createState() => _MonitorScreenState();
}

class _MonitorScreenState extends State<MonitorScreen> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  bool _relayState = false;
  double _temperature = 0.0;
  double _humidity = 0.0;
  int _soilMoisture = 0;
  @override
  void initState() {
    super.initState();
    _database.child('relayControl').onValue.listen((event) {
      setState(() {
        _relayState = event.snapshot.value == 1;
      });
    });
    _database.child('sensorData').onValue.listen((event) {
      var data = event.snapshot.value as Map<String, dynamic>?;
      setState(() {
        _temperature = data!['temperature'] as double;
        _humidity = data['humidity'] as double;
        _soilMoisture = data['soilMoisture'] as int;
      });
    });
  }

  void _toggleRelay(bool value) {
    _database.child('relayControl').set(value ? 1 : 0);
    setState(() {
      _relayState = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Agriculture Monitor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Temperature: $_temperature °C'),
            Text('Humidity: $_humidity %'),
            Text('Soil Moisture: $_soilMoisture %'),
            Text('Soil Moisture: $_relayState'),
            SwitchListTile(
              title: Text('Motor Control'),
              value: _relayState,
              onChanged: _toggleRelay,
            ),
          ],
        ),
      ),
    );
  }
}
// class SensorDataScreen extends StatefulWidget {
//   @override
//   _SensorDataScreenState createState() => _SensorDataScreenState();
// }

// class _SensorDataScreenState extends State<SensorDataScreen> {
//   final DatabaseReference _database = FirebaseDatabase.instance.reference();
//   double _soilMoisture = 0.0;
//   double _humidity = 0.0;
//   double _temperature = 0.0;
//   int _relayState = 0;
//   @override
//   void initState() {
//     super.initState();
//     _database.child('sensor').onValue.listen((event) {
//       final data = event.snapshot.value as Map<dynamic, dynamic>?;

//       if (data != null) {
//         setState(() {
//           _soilMoisture = data['soilMoisture'];
//           _humidity = data['humidity'] ?? 0.0;
//           _temperature = data['temperature'] ?? 0.0;
//           _relayState = data['relayState'] ?? 0;
//         });
//       }
//     });
//   }

//   void _setRelayState(int state) {
//     setState(() {
//       // _database.child('control').update(
//       // {"project":{"control":{'relay': state}}}
//       //   {'relay': state});
//     });
//     _relayState = state; // تحديث قيمة _relayState بقيمة state

//     _database
//         .child(
//           "project-id",
//         )
//         .child(
//           "control",
//         )
//         .update(
//       {
//         "relay": state,
//       },
//     );

//     print("Relay State: $state");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sensor Data'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Soil Moisture: $_soilMoisture%'),
//             Text('Humidity: $_humidity%'),
//             Text('Temperature: $_temperature°C'),
//             Text('Relay State: ${_relayState == 1 ? 'ON' : 'OFF'}'),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ElevatedButton(
//                   onPressed: () => _setRelayState(1),
//                   child: Text('Turn ON'),
//                 ),
//                 SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: () => _setRelayState(0),
//                   child: Text('Turn OFF'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
