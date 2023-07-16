import 'package:intl/intl.dart';

class StaticsModel {
  final double inputValue;
  final int month;
  final int year;
  StaticsModel(this.inputValue, this.month, this.year);
  static List<StaticsModel> getIndicateurModel(List<dynamic> json) {
    List<StaticsModel> list = [];
    for (var item in json) {
      list.add(StaticsModel.fromJson(item));
    }
    return list;
  }

  factory StaticsModel.fromJson(Map<String, dynamic> json) {
    return StaticsModel(
      json['average_value'] ?? 0.0,
      json['month'] ?? 0,
      json['year'] ?? 0,
    );
  }
}
