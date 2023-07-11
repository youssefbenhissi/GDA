part of 'fiche_gda_bloc.dart';

@immutable
abstract class FicheGDAState extends Equatable {
  const FicheGDAState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialFicheGDAState extends FicheGDAState {
  const InitialFicheGDAState._() : super._();
}

@immutable
class LoadingFicheGDAState extends FicheGDAState {
  const LoadingFicheGDAState._() : super._();
}

@immutable
class LoadedFicheGDAState extends FicheGDAState {
  final FicheGDAModel model;
  const LoadedFicheGDAState._(this.model) : super._();

  @override
  List<Object?> get props => [model];
}

@immutable
class FailedFicheGDAState extends FicheGDAState {
  const FailedFicheGDAState._() : super._();
}
