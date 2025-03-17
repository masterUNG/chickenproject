import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DataTableModel {

  final int day;
  final double cp;
  final double me;
  final String weight;
  DataTableModel({
    required this.day,
    required this.cp,
    required this.me,
    required this.weight,
  });




  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'cp': cp,
      'me': me,
      'weight': weight,
    };
  }

  factory DataTableModel.fromMap(Map<String, dynamic> map) {
    return DataTableModel(
      day: (map['day'] ?? 0) as int,
      cp: (map['cp'] ?? 0.0) as double,
      me: (map['me'] ?? 0.0) as double,
      weight: (map['weight'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataTableModel.fromJson(String source) => DataTableModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
