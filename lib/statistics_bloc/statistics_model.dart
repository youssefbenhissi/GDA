class StaticsModel {
  final double inputValue;
  final String date;
  StaticsModel(this.inputValue, this.date);
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
      "${json['month']}/${json['year']}",
    );
  }
}
