import 'package:chickenproject/utility/app_constant.dart';
import 'package:chickenproject/utility/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_undraw/ms_undraw.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var titles = <String>[
    'Cal Intake',
    'Farm Manage',
    'Broiler Growth',
  ];

  var pathImages = <UnDrawIllustration>[
    UnDrawIllustration.add_color,
    UnDrawIllustration.farming,
    UnDrawIllustration.abstract,
  ];

  var nameRountes = <String>[
    '/calIntake',
    '/farmManage',
    '/broilerGrowth',
  ];

  AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();

    if (appController.cpIntakeNews.isEmpty) {
      for (var i = 0; i < AppConstant.cpIntakeOld.length; i++) {
        appController.cpIntakeNews.add(0.0);
        appController.meIntakeNews.add(0.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
              itemCount: titles.length,
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.toNamed(nameRountes[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: Column(
                        children: [
                          UnDraw(
                            color: Theme.of(context).primaryColor,
                            illustration: pathImages[index],
                            width: 130,
                            height: 130,
                          ),
                          Text(titles[index]),
                        ],
                      ),
                    ),
                  ))),
    );
  }
}
