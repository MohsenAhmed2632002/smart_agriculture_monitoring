import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:smart_agriculture_monitoring/ViewModel/ControllerView.dart';
import 'package:smart_agriculture_monitoring/core/Font.dart';
import 'package:smart_agriculture_monitoring/core/app_string.dart';
import 'package:smart_agriculture_monitoring/core/image.dart';

class SplashView extends StatefulWidget {
  SplashView._intarnal();
  static final SplashView _instance = SplashView._intarnal();
  factory SplashView() => _instance;
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState() {

    super.initState();
    
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ControllerView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .7,
              child: Image.asset(
                AssetsImage.imagelogo,
                filterQuality: FilterQuality.high,
              ),
            ),
            Text(
              AppStrings.appName,
              style: getMediumTextStyle(
                context: context,
              ),
            )
          ],
        ),
      ),
    );
  }
}
