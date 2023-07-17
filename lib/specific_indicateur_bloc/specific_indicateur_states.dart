part of 'specific_indicateur_bloc.dart';

@immutable
abstract class SpecificIndicateurState extends Equatable {
  const SpecificIndicateurState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialSpecificIndicateurState extends SpecificIndicateurState {
  const InitialSpecificIndicateurState._() : super._();
}

@immutable
class LoadingSpecificIndicateurState extends SpecificIndicateurState {
  const LoadingSpecificIndicateurState._() : super._();
}

@immutable
class LoadedSpecificIndicateurState extends SpecificIndicateurState {
  final List<IndicateurModel> models;
  const LoadedSpecificIndicateurState._(this.models) : super._();

  @override
  List<Object?> get props => [models];
}

@immutable
class FailedSpecificIndicateurState extends SpecificIndicateurState {
  const FailedSpecificIndicateurState._() : super._();
}
