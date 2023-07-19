part of 'specific_fiche_gda_bloc.dart';

@immutable
abstract class SpecificFicheGDAState extends Equatable {
  const SpecificFicheGDAState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialSpecificFicheGDAState extends SpecificFicheGDAState {
  const InitialSpecificFicheGDAState._() : super._();
}

@immutable
class LoadingSpecificFicheGDAState extends SpecificFicheGDAState {
  const LoadingSpecificFicheGDAState._() : super._();
}

@immutable
class LoadedSpecificFicheGDAState extends SpecificFicheGDAState {
  final SpecificFicheGDAModel model;
  const LoadedSpecificFicheGDAState._(this.model) : super._();

  @override
  List<Object?> get props => [model];
}

@immutable
class FailedSpecificFicheGDAState extends SpecificFicheGDAState {
  const FailedSpecificFicheGDAState._() : super._();
}
