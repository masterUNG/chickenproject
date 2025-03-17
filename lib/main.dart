import 'package:chickenproject/states/broiler_growth.dart';
import 'package:chickenproject/states/calculate_intake.dart';
import 'package:chickenproject/states/farm_manage.dart';
import 'package:chickenproject/states/main_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: '/mainHome', page: () => MainHome()),
  GetPage(name: '/calIntake', page: () => CalculateIntake()),
  GetPage(name: '/farmManage', page: () => FarmManage()),
  GetPage(name: '/broilerGrowth', page: () => BroilerGrowth())
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages,
      initialRoute: '/mainHome',
    );
  }
}
