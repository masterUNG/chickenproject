import 'package:chickenproject/models/data_model.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  RxList<double> cpIntakes = <double>[].obs;

  RxList<double> meIntakes = <double>[].obs;

  RxList<int?> chooseIndexs = <int?>[null].obs;

  RxList<DataModel> cpDataModels = <DataModel>[].obs;
  
  RxList<DataModel> meDataModels = <DataModel>[].obs;

  RxList<double> cpConversions = <double>[].obs;

  RxList<double> meConversions = <double>[].obs;


  RxList<double> cpIntakeNews = <double>[].obs;
  RxList<double> meIntakeNews = <double>[].obs;
}
