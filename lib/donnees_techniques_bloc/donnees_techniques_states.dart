part of 'donnees_techniques_bloc.dart';

@immutable
abstract class DonneesTechniquesState extends Equatable {
  const DonneesTechniquesState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialDonnesTechniquesState extends DonneesTechniquesState {
  const InitialDonnesTechniquesState._() : super._();
}
