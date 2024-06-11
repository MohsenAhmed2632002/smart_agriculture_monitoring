import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:smart_agriculture_monitoring/ViewModel/Home_View_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_agriculture_monitoring/core/Font.dart';
import 'package:smart_agriculture_monitoring/core/app_string.dart';
import 'package:smart_agriculture_monitoring/core/theme.dart';

class HomeView extends GetWidget<HomeViewModel> {
  HomeView({super.key});
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
      body: GetBuilder<HomeViewModel>(
          init: Get.put(HomeViewModel()),
          builder: (controller) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: StreamBuilder<Map<String, dynamic>>(
                  stream: controller.fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Container(
                          height: MediaQuery.sizeOf(context).height,
                          width: MediaQuery.sizeOf(context).width,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      Map<String, dynamic>? myMap = snapshot.data;
                      if (double.parse(
                            myMap!["feeds"][0]["field1"],
                          ) >
                          25) {
                        controller.Notificationfield2();
                      } 
                      // else if (double.parse(
                      //       myMap["feeds"][0]["field2"],
                      //     ) >
                      //     25) {
                      //   controller.Notificationfield2();
                      // }

                      return FadeInUp(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                // height: MediaQuery.sizeOf(context).height,
                                width: MediaQuery.sizeOf(context).width,
                                child: Column(
                                  children: [
                                    Text(
                                      "name:",
                                      style: getBoldTextStyle(
                                        context: context,
                                      ),
                                    ),
                                    Text(
                                      "${myMap["channel"]["name"]}",
                                      style: getLightTextStyle(
                                        context: context,
                                      ),
                                    ),
                                    Text(
                                      "description:",
                                      style: getBoldTextStyle(
                                        context: context,
                                      ),
                                    ),
                                    Text(
                                      "${myMap["channel"]["description"]}",
                                      style: getLightTextStyle(
                                        context: context,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "${myMap["channel"]["field1"]}",
                                          style: getRegulerTextStyle(
                                            context: context,
                                          ),
                                        ),
                                        Text(
                                          "${myMap["feeds"][0]["field1"]}",
                                          style: getRegulerTextStyle(
                                            context: context,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 500,
                                      child: LineChart(
                                        curve: Curves.bounceInOut,
                                        LineChartData(
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: [
                                                FlSpot(
                                                  0,
                                                  0,
                                                ),
                                                FlSpot(
                                                  6,
                                                  10,
                                                ),
                                                FlSpot(
                                                  11,
                                                  15,
                                                ),
                                                FlSpot(
                                                  double.parse(
                                                    myMap["feeds"][0]["field1"],
                                                  ),
                                                  double.parse(
                                                    myMap["feeds"][0]["field1"],
                                                  ),
                                                ),
                                              ],
                                              barWidth: 4,
                                              color: MaterialTheme.lightScheme()
                                                  .primary,
                                              isCurved: true,
                                              belowBarData: BarAreaData(
                                                show: true,
                                                color:
                                                    MaterialTheme.lightScheme()
                                                        .primary
                                                        .withOpacity(.3),
                                              ),
                                              dotData: FlDotData(
                                                show: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "${myMap["channel"]["field2"]}",
                                          style: getRegulerTextStyle(
                                            context: context,
                                          ),
                                        ),
                                        Text(
                                          " ${myMap["feeds"][0]["field2"]}",
                                          style: getRegulerTextStyle(
                                            context: context,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 500,
                                      child: LineChart(
                                        curve: Curves.bounceInOut,
                                        LineChartData(
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: [
                                                FlSpot(
                                                  0,
                                                  0,
                                                ),
                                                FlSpot(
                                                  38,
                                                  20,
                                                ),
                                                FlSpot(
                                                  15,
                                                  40,
                                                ),
                                                FlSpot(
                                                  double.parse(
                                                        myMap["feeds"][0]
                                                            ["field2"],
                                                      ) ??
                                                      0,
                                                  double.parse(
                                                        myMap["feeds"][0]
                                                            ["field2"],
                                                      ) ??
                                                      0,
                                                ),
                                              ],
                                              barWidth: 4,
                                              color: MaterialTheme.lightScheme()
                                                  .primary,
                                              isCurved: true,
                                              belowBarData: BarAreaData(
                                                show: true,
                                                color:
                                                    MaterialTheme.lightScheme()
                                                        .primary
                                                        .withOpacity(.3),
                                              ),
                                              dotData: FlDotData(
                                                show: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "${myMap["channel"]["field3"]}:",
                                          style: getRegulerTextStyle(
                                            context: context,
                                          ),
                                        ),
                                        Text(
                                          " ${myMap["feeds"][0]["field3"]}",
                                          style: getRegulerTextStyle(
                                            context: context,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 500,
                                      child: LineChart(
                                        LineChartData(
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: [
                                                FlSpot(
                                                  0,
                                                  0,
                                                ),
                                                FlSpot(
                                                  10,
                                                  10,
                                                ),
                                                FlSpot(
                                                  15,
                                                  15,
                                                ),
                                                FlSpot(
                                                  15,
                                                  20,
                                                ),
                                                FlSpot(
                                                  18,
                                                  20,
                                                ),
                                                FlSpot(
                                                  double.parse(
                                                    myMap["feeds"][0]["field3"],
                                                  ),
                                                  double.parse(
                                                    myMap["feeds"][0]["field3"],
                                                  ),
                                                ),
                                              ],
                                              barWidth: 4,
                                              color: MaterialTheme.lightScheme()
                                                  .primary,
                                              isCurved: true,
                                              dotData: FlDotData(
                                                show: true,
                                              ),
                                              belowBarData: BarAreaData(
                                                show: true,
                                                color:
                                                    MaterialTheme.lightScheme()
                                                        .primary
                                                        .withOpacity(.3),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "${myMap["channel"]["field4"]}:",
                                          style: getRegulerTextStyle(
                                            context: context,
                                          ),
                                        ),
                                        Text(
                                          "${myMap["feeds"][0]["field4"]}",
                                          style: getRegulerTextStyle(
                                            context: context,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 500,
                                      child: LineChart(
                                        curve: Curves.bounceInOut,
                                        LineChartData(
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: [
                                                FlSpot(
                                                  0,
                                                  0,
                                                ),
                                                FlSpot(
                                                  5,
                                                  5,
                                                ),
                                                FlSpot(
                                                  6,
                                                  10,
                                                ),
                                                FlSpot(
                                                  8,
                                                  8,
                                                ),
                                                FlSpot(
                                                  11,
                                                  13,
                                                ),
                                                FlSpot(
                                                  double.parse(
                                                    myMap["feeds"][0]["field4"],
                                                  ),
                                                  double.parse(
                                                    myMap["feeds"][0]["field4"],
                                                  ),
                                                ),
                                              ],
                                              barWidth: 4,
                                              color: MaterialTheme.lightScheme()
                                                  .primary,
                                              isCurved: true,
                                              dotData: FlDotData(
                                                show: true,
                                              ),
                                              belowBarData: BarAreaData(
                                                show: true,
                                                color:
                                                    MaterialTheme.lightScheme()
                                                        .primary
                                                        .withOpacity(.3),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            );
          }),
    );
  }
}
