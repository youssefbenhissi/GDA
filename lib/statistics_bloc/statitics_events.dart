part of 'statistics_bloc.dart';

abstract class StatisticsEvent extends Equatable {
  const StatisticsEvent._();
  @override
  List<Object?> get props => [];
}

@immutable
class LoadStatisticsFuncEvent extends StatisticsEvent {
  final String login;
  const LoadStatisticsFuncEvent._(this.login) : super._();
  @override
  List<Object?> get props => [login];
}
