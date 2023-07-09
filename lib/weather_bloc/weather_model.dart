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

  WeatherModel.fromjson(Map<String, dynamic> json) {
    cityName = json['name'];
    temp = json['main']['temp'];
    wind = json['wind']['speed'];
    humidity = json['main']['humidity'];
    feelsLike = json['weather']['description'];
    pressure = json['main']['pressure'];
  }
}
