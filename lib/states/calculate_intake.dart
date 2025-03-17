import 'package:chickenproject/models/data_table_model.dart';
import 'package:chickenproject/utility/app_constant.dart';
import 'package:chickenproject/utility/app_controller.dart';
import 'package:chickenproject/utility/app_service.dart';
import 'package:chickenproject/widgets/widget_button.dart';
import 'package:chickenproject/widgets/widget_form.dart';
import 'package:chickenproject/widgets/widget_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class CalculateIntake extends StatefulWidget {
  const CalculateIntake({super.key});

  @override
  State<CalculateIntake> createState() => _CalculateIntakeState();
}

class _CalculateIntakeState extends State<CalculateIntake> {
  final formKey = GlobalKey<FormState>();

  TextEditingController metaController = TextEditingController();
  TextEditingController crudeController = TextEditingController();
  TextEditingController feedController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  AppController appController = Get.put(AppController());

  var indexDays = <int>[];

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < AppConstant.cpIntakeOld.length; i++) {
      indexDays.add(i + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculate Intake')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          elementTop(),
          SizedBox(height: 16),
          elementIntake(),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: Get.width * 0.5 - 12 - 16,
                  height: Get.width * 0.5 - 12 - 16 + 15,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Text(
                          appController.cpConversions.isEmpty
                              ? '???'
                              : AppService().changeNumberToString(
                                  number: appController.cpConversions.last),
                          style: AppConstant.h1Style())),
                      Text('CP Conversion', style: AppConstant.h3Style()),
                    ],
                  )),
              Container(
                  width: Get.width * 0.5 - 12 - 16,
                  height: Get.width * 0.5 - 12 - 16 + 15,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('???', style: AppConstant.h1Style()),
                      Text('ME Conversion', style: AppConstant.h3Style()),
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }

  Row elementIntake() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: Get.width * 0.5 - 12 - 16,
          height: Get.width * 0.5 - 12 - 16,
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                  appController.cpIntakes.isEmpty
                      ? '???'
                      : appController.cpIntakes.last.toString(),
                  style: AppConstant.h1Style())),
              Obx(() {
                return appController.chooseIndexs.last == null
                    ? SizedBox()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${AppConstant.cpIntakeOld[appController.chooseIndexs.last! - 1]}',
                            style: AppConstant.h2Style(color: Colors.red),
                          ),
                          Text('(day:${appController.chooseIndexs.last})'),
                        ],
                      );
              }),
              Text(
                'CP Intake',
                style: AppConstant.h3Style(),
              ),
            ],
          ),
        ),
        Container(
          width: Get.width * 0.5 - 12 - 16,
          height: Get.width * 0.5 - 12 - 16,
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                  appController.meIntakes.isEmpty
                      ? '???'
                      : appController.meIntakes.last.toString(),
                  style: AppConstant.h1Style())),
              Obx(() => appController.chooseIndexs.last == null
                  ? SizedBox()
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${AppConstant.meIntakeOld[appController.chooseIndexs.last! - 1]}',
                          style:
                              AppConstant.h2Style(color: Colors.amber.shade700),
                        ),
                        Text('(day:${appController.chooseIndexs.last})')
                      ],
                    )),
              Text(
                'ME Intake',
                style: AppConstant.h3Style(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row elementTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Farm1', style: AppConstant.h2Style()),
        WidgetIconButton(
            iconData: Icons.android,
            onPressed: () {
              appController.chooseIndexs.clear();
              appController.chooseIndexs.add(null);

              Get.bottomSheet(formBottomSheet(), isScrollControlled: true);
            }),
      ],
    );
  }

  FractionallySizedBox formBottomSheet() {
    return FractionallySizedBox(
        heightFactor: 0.65,
        child: Container(
            width: Get.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Form(
              key: formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                children: [
                  Text('Farm1', style: AppConstant.h2Style()),
                  SizedBox(height: 16),
                  Obx(() => DropdownButtonFormField(
                        validator: (value) {
                          if (value == null) {
                            return 'Please Choode Day';
                          } else {
                            return null;
                          }
                        },
                        hint: Text('Please Choode Day'),
                        value: appController.chooseIndexs.last,
                        items: indexDays
                            .map(
                              (e) => DropdownMenuItem(
                                  child: Text(e.toString()), value: e),
                            )
                            .toList(),
                        onChanged: (value) {
                          appController.chooseIndexs.add(value);
                        },
                      )),
                  SizedBox(height: 16),
                  WidgetForm(
                    controller: metaController,
                    labelText: 'Metaboliazble Energy',
                    validator: (p0) {
                      if (p0?.isEmpty ?? true) {
                        return 'Please Fill Meteboliazble';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  WidgetForm(
                    controller: crudeController,
                    labelText: 'Crude Protein',
                    validator: (p0) {
                      if (p0?.isEmpty ?? true) {
                        return 'Please Fill Crude';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  WidgetForm(
                    controller: feedController,
                    labelText: 'Feed Intake',
                    validator: (p0) {
                      if (p0?.isEmpty ?? true) {
                        return 'Please Fill Feed';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  WidgetForm(
                    controller: weightController,
                    labelText: 'Weight',
                    validator: (p0) {
                      if (p0?.isEmpty ?? true) {
                        return 'Please Fill Weight';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  WidgetButton(
                      label: 'Calculate',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          //for CP
                          double cp = double.parse(crudeController.text) *
                              double.parse(feedController.text) /
                              100;
                          appController.cpIntakes.add(cp);

                          double cpConvert =
                              cp / double.parse(weightController.text);

                          appController.cpConversions.add(cpConvert);

                          appController.cpIntakeNews[
                              appController.chooseIndexs.last!] = cp;

                          //for ME
                          double me = double.parse(metaController.text) *
                              double.parse(feedController.text) /
                              1000;
                          appController.meIntakes.add(me);

                          appController.meIntakeNews[
                              appController.chooseIndexs.last!] = me;

                          //for DataTableModel
                          DataTableModel dataTableModel = DataTableModel(
                              day: appController.chooseIndexs.last!,
                              cp: cp,
                              me: me,
                              weight: weightController.text);
                          appController.dataTableModels.add(dataTableModel);

                          Get.back();
                        }
                      }),
                ],
              ),
            )));
  }
}
