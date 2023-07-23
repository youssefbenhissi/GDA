class WeatherModel {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  String? feelsLike;
  int? pressure;

  WeatherModel(
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.feelsLike,
    this.pressure,
  );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      json['name'] as String,
      json['main']['temp'] as double,
      json['wind']['speed'] as double,
      json['main']['humidity'] as int,
      json['weather'][0]['description'] as String,
      json['main']['pressure'] as int,
    );
  }
}
