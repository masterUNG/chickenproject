import 'package:chickenproject/utility/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FarmManage extends StatefulWidget {
  const FarmManage({super.key});

  @override
  State<FarmManage> createState() => _FarmManageState();
}

class _FarmManageState extends State<FarmManage> {
  AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Farm Manage')),
      body: Obx(() => appController.dataTableModels.isEmpty
          ? SizedBox()
          : ListView(padding: EdgeInsets.symmetric(horizontal: 16),
            children: [

              Divider(),

              Row(
                children: [
                  Expanded(flex: 1,
                    child: Text('Day')),
                  Expanded(flex: 2,
                    child: Text('CP')),
                  Expanded(flex: 2,
                    child: Text('ME')),
                  Expanded(flex: 2,
                    child: Text('Weight')),
                ],
              ),

              Divider(),


              ListView.builder(physics: ScrollPhysics(), shrinkWrap: true,
                  itemCount: appController.dataTableModels.length,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                              appController.dataTableModels[index].day.toString())),
                      Expanded(
                          flex: 2,
                          child: Text(
                              appController.dataTableModels[index].cp.toString())),
                      Expanded(
                          flex: 2,
                          child: Text(
                              appController.dataTableModels[index].me.toString())),
                      Expanded(
                          flex: 2,
                          child: Text(appController.dataTableModels[index].weight
                              .toString())),
                    ],
                  ),
                ),
            ],
          )),
    );
  }
}
