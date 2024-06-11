import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_agriculture_monitoring/ViewModel/order_View_View_model.dart';
import 'package:smart_agriculture_monitoring/core/Font.dart';
import 'package:smart_agriculture_monitoring/core/app_string.dart';
import 'package:smart_agriculture_monitoring/core/theme.dart';

class OrderView extends GetWidget<OrderViewModel> {
  const OrderView({super.key});

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
      body: GetBuilder<OrderViewModel>(
          init: Get.put(OrderViewModel()),
          builder: (controller) {
            return Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "PumpState:",
                        style: getBoldTextStyle(context: context),
                      ),
                      controller.relayState
                          ? Text(
                              "On",
                              style: getBoldTextStyle(
                                context: context,
                              ),
                            )
                          : Text(
                              "Off",
                              style: getBoldTextStyle(
                                  context: context, color: Colors.red),
                            ),
                    ],
                  ),
                  FadeInUpBig(
                    duration: Duration(milliseconds: 1500),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          MaterialTheme.lightMediumContrastScheme().primary,
                        ),
                        minimumSize: MaterialStatePropertyAll<Size>(
                          Size(
                            MediaQuery.sizeOf(context).width * .9,
                            MediaQuery.sizeOf(context).height * .08,
                          ),
                        ),
                      ),
                      onPressed: () {
                        controller.toggleRelay(true);
                      },
                      child: Text(
                        "Pump On",
                        style: getRegulerTextStyle(
                          context: context,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  FadeInLeftBig(
                    duration: Duration(milliseconds: 1500),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            MaterialTheme.lightMediumContrastScheme().primary),
                        minimumSize: MaterialStatePropertyAll<Size>(
                          Size(
                            MediaQuery.sizeOf(context).width * .9,
                            MediaQuery.sizeOf(context).height * .08,
                          ),
                        ),
                      ),
                      onPressed: () {
                        controller.toggleRelay(
                          false,
                        );
                      },
                      child: Text(
                        "Pump Off",
                        style: getRegulerTextStyle(
                          context: context,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  FadeInDownBig(
                    duration: Duration(milliseconds: 1500),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            MaterialTheme.lightMediumContrastScheme().primary),
                        minimumSize: MaterialStatePropertyAll<Size>(
                          Size(
                            MediaQuery.sizeOf(context).width * .9,
                            MediaQuery.sizeOf(context).height * .08,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        controller.mylaunchUrl();
                      },
                      child: Text(
                        "Feedback",
                        style: getRegulerTextStyle(
                          context: context,
                          color: Colors.white,
                        ),
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
