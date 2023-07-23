part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent._();
  @override
  List<Object?> get props => [];
}

@immutable
class LoadWeatherFuncEvent extends WeatherEvent {
  final String location;
  const LoadWeatherFuncEvent._(this.location) : super._();
  @override
  List<Object?> get props => [location];
}
