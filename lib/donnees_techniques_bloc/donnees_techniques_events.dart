part of 'donnees_techniques_bloc.dart';

abstract class DonneesTechniquesEvent extends Equatable {
  const DonneesTechniquesEvent._();

  @override
  List<Object?> get props => [];
}

@immutable
class InsertDonneesTechniquesFuncEvent extends DonneesTechniquesEvent {
  final String createdBy;
  final String inputValueVolumePompe;
  final int idIndicateurVolumePompe;
  final String inputValueVolumeDistribue;
  final int idIndicateurVolumeDistribue;
  final String inputValueVolumeEauDeJavel;
  final int idIndicateurVolumeEauDeJavel;
  final String inputValueTarifAdopte;
  final int idIndicateurTarifAdopte;
  final String inputValueCoutEau;
  final int idIndicateurCoutEau;
  final String inputValueNombreDeJoursArret;
  final int idIndicateur;
  final int idSaisie;
  final int month;
  final int year;
  const InsertDonneesTechniquesFuncEvent._(
    this.createdBy,
    this.inputValueVolumePompe,
    this.idIndicateurVolumePompe,
    this.inputValueVolumeDistribue,
    this.idIndicateurVolumeDistribue,
    this.inputValueVolumeEauDeJavel,
    this.idIndicateurVolumeEauDeJavel,
    this.inputValueTarifAdopte,
    this.idIndicateurTarifAdopte,
    this.inputValueCoutEau,
    this.idIndicateurCoutEau,
    this.inputValueNombreDeJoursArret,
    this.idIndicateur,
    this.idSaisie,
    this.month,
    this.year,
  ) : super._();
  @override
  List<Object?> get props => [
        createdBy,
        inputValueVolumePompe,
        idIndicateurVolumePompe,
        inputValueVolumeDistribue,
        idIndicateurVolumeDistribue,
        inputValueVolumeEauDeJavel,
        idIndicateurVolumeEauDeJavel,
        inputValueTarifAdopte,
        idIndicateurTarifAdopte,
        inputValueCoutEau,
        idIndicateurCoutEau,
        inputValueNombreDeJoursArret,
        idIndicateur,
        idSaisie,
        month,
        year,
      ];
}
