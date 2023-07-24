part of 'specific_donnees_techniques_bloc.dart';

@immutable
abstract class SpecificDonneesTechniquesState extends Equatable {
  const SpecificDonneesTechniquesState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialSpecificDonneesTechniquesState
    extends SpecificDonneesTechniquesState {
  const InitialSpecificDonneesTechniquesState._() : super._();
}

@immutable
class LoadingSpecificDonneesTechniquesState
    extends SpecificDonneesTechniquesState {
  const LoadingSpecificDonneesTechniquesState._() : super._();
}

@immutable
class LoadedSpecificDonneesTechniquesState
    extends SpecificDonneesTechniquesState {
  final List<IndicateurModel> models;
  const LoadedSpecificDonneesTechniquesState._(this.models) : super._();

  @override
  List<Object?> get props => [models];
}

@immutable
class FailedSpecificDonneesTechniquesState
    extends SpecificDonneesTechniquesState {
  const FailedSpecificDonneesTechniquesState._() : super._();
}
