part of 'recettes_realisees_bloc.dart';

@immutable
abstract class RecettesRealiseesState extends Equatable {
  const RecettesRealiseesState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialRecettesRealiseesState extends RecettesRealiseesState {
  const InitialRecettesRealiseesState._() : super._();
}
