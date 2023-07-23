part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialWeatherState extends WeatherState {
  const InitialWeatherState._() : super._();
}

@immutable
class LoadingWeatherState extends WeatherState {
  const LoadingWeatherState._() : super._();
}

@immutable
class LoadedWeatherState extends WeatherState {
  final WeatherModel? model;
  const LoadedWeatherState._(this.model) : super._();

  @override
  List<Object?> get props => [model];
}

@immutable
class FailedWeatherState extends WeatherState {
  const FailedWeatherState._() : super._();
}
