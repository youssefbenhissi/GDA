part of 'recettes_realisees_bloc.dart';

abstract class RecettesRealiseesEvent extends Equatable {
  const RecettesRealiseesEvent._();

  @override
  List<Object?> get props => [];
}

@immutable
class InsertRecettesRealiseesFuncEvent extends RecettesRealiseesEvent {
  final String createdBy;
  final String inputValueRecettesVenteEau;
  final int idIndicateurRecettesVenteEau;
  final String inputValueRecettesAdhesion;
  final int idIndicateurRecettesAdhesion;
  final String inputValueRecettesAbonnement;
  final int idIndicateurRecettesAbonnement;
  final String inputValueRecettesCotisations;
  final int idIndicateurRecettesCotisations;
  final String inputValueAutresRecettes;
  final int idIndicateurAutresRecettes;
  final int idSaisie;
  final int month;
  final int year;
  const InsertRecettesRealiseesFuncEvent._(
    this.createdBy,
    this.inputValueRecettesVenteEau,
    this.idIndicateurRecettesVenteEau,
    this.inputValueRecettesAdhesion,
    this.idIndicateurRecettesAdhesion,
    this.inputValueRecettesAbonnement,
    this.idIndicateurRecettesAbonnement,
    this.inputValueRecettesCotisations,
    this.idIndicateurRecettesCotisations,
    this.inputValueAutresRecettes,
    this.idIndicateurAutresRecettes,
    this.idSaisie,
    this.month,
    this.year,
  ) : super._();
  @override
  List<Object?> get props => [
        createdBy,
        inputValueRecettesVenteEau,
        idIndicateurRecettesVenteEau,
        inputValueRecettesAdhesion,
        idIndicateurRecettesAdhesion,
        inputValueRecettesAbonnement,
        idIndicateurRecettesAbonnement,
        inputValueRecettesCotisations,
        idIndicateurRecettesCotisations,
        inputValueAutresRecettes,
        idIndicateurAutresRecettes,
        idSaisie,
        month,
        year,
      ];
}
