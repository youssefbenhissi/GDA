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
