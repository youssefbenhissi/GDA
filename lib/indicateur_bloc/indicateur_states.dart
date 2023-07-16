part of 'indicateur_bloc.dart';

@immutable
abstract class IndicateurState extends Equatable {
  const IndicateurState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialIndicateurState extends IndicateurState {
  const InitialIndicateurState._() : super._();
}

@immutable
class LoadingIndicateurState extends IndicateurState {
  const LoadingIndicateurState._() : super._();
}

@immutable
class LoadedIndicateurState extends IndicateurState {
  final List<IndicateurModel> models;
  const LoadedIndicateurState._(this.models) : super._();

  @override
  List<Object?> get props => [models];
}

@immutable
class FailedIndicateurState extends IndicateurState {
  const FailedIndicateurState._() : super._();
}
