part of 'specific_recettes_realisees_bloc.dart';

@immutable
abstract class SpecificRecettesRealiseesState extends Equatable {
  const SpecificRecettesRealiseesState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialSpecificRecettesRealiseesState
    extends SpecificRecettesRealiseesState {
  const InitialSpecificRecettesRealiseesState._() : super._();
}

@immutable
class LoadingSpecificRecettesRealiseesState
    extends SpecificRecettesRealiseesState {
  const LoadingSpecificRecettesRealiseesState._() : super._();
}

@immutable
class LoadedSpecificRecettesRealiseesState
    extends SpecificRecettesRealiseesState {
  final List<IndicateurModel> models;
  const LoadedSpecificRecettesRealiseesState._(this.models) : super._();

  @override
  List<Object?> get props => [models];
}

@immutable
class FailedSpecificRecettesRealiseesState
    extends SpecificRecettesRealiseesState {
  const FailedSpecificRecettesRealiseesState._() : super._();
}
