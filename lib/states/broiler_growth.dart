import 'package:chickenproject/models/data_model.dart';
import 'package:chickenproject/utility/app_constant.dart';
import 'package:chickenproject/utility/app_controller.dart';
import 'package:chickenproject/utility/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BroilerGrowth extends StatefulWidget {
  const BroilerGrowth({super.key});

  @override
  State<BroilerGrowth> createState() => _BroilerGrowthState();
}

class _BroilerGrowthState extends State<BroilerGrowth> {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Broiler Growth'),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: Get.width * 0.8,
                    height: Get.width * 0.8,
                    child: FutureBuilder(
                      future: AppService()
                          .createDataModel(valueYs: AppConstant.cpIntakeOld),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<DataModel> dataModels = snapshot.data!;

                          print('## dataModel ---> ${dataModels.length}');

                          if (dataModels.isEmpty) {
                            return SizedBox();
                          } else {
                            return SfCartesianChart(
                                primaryXAxis: CategoryAxis(),
                                title: ChartTitle(text: 'CP Intake'),
                                series: [
                                  LineSeries(
                                    dataSource: dataModels,
                                    xValueMapper: (datum, index) =>
                                        datum.valueX,
                                    yValueMapper: (datum, index) =>
                                        datum.valueY,
                                  )
                                ]);
                          }
                        } else {
                          return SizedBox();
                        }
                      },
                    )),
              ],
            ),
            FutureBuilder(
              future: AppService()
                  .createDataModel(valueYs: AppConstant.meIntakeOld),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DataModel> dataModels = snapshot.data!;

                  if (dataModels.isEmpty) {
                    return SizedBox();
                  } else {
                    return SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: [ColumnSeries(dataSource: dataModels,
                        xValueMapper: (datum, index) => datum.valueX, yValueMapper: (datum, index) => datum.valueY,)],
                    );
                  }
                } else {
                  return SizedBox();
                }
              },
            ),
          ],
        ));
  }
}
