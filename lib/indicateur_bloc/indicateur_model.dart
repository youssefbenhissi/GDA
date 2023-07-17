import 'package:intl/intl.dart';

class IndicateurModel {
  final String inputValue;
  IndicateurModel(this.inputValue);
  static IndicateurModel getIndicateurModel(List<dynamic> json) {
    List<IndicateurModel> list = [];
    for (var item in json) {
      list.add(IndicateurModel.fromJson(item));
    }
    if (list.isNotEmpty) {
      return list.first;
    } else {
      return IndicateurModel("0");
    }
  }

  factory IndicateurModel.fromJson(Map<String, dynamic> json) {
    return IndicateurModel(
      json['average_value'].toString(),
    );
  }
}
