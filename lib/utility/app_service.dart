import 'package:chickenproject/models/data_model.dart';
import 'package:intl/intl.dart';

class AppService {
  
  String changeNumberToString({required double number}) {
    NumberFormat numberFormat = NumberFormat('##0.0#', 'en_US');

    String string = numberFormat.format(number);

    return string;
  }

  Future<List<DataModel>> createDataModel(
      {required List<double> valueYs}) async {
    var dataModels = <DataModel>[];

    for (var i = 0; i < valueYs.length; i++) {
      DataModel model = DataModel(valueX: i.toDouble(), valueY: valueYs[i]);

      dataModels.add(model);
    }

    return dataModels;
  }
}
