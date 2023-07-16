part of 'statistics_bloc.dart';

@immutable
abstract class StatisticsState extends Equatable {
  const StatisticsState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialStaticsState extends StatisticsState {
  const InitialStaticsState._() : super._();
}

@immutable
class LoadingStaticsState extends StatisticsState {
  const LoadingStaticsState._() : super._();
}

@immutable
class LoadedStatiticsState extends StatisticsState {
  final List<StaticsModel> models;
  const LoadedStatiticsState._(this.models) : super._();

  @override
  List<Object?> get props => [models];
}

@immutable
class FailedIndicateurState extends StatisticsState {
  const FailedIndicateurState._() : super._();
}
