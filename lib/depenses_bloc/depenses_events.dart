part of 'depenses_bloc.dart';

abstract class DepensesEvent extends Equatable {
  const DepensesEvent._();

  @override
  List<Object?> get props => [];
}

@immutable
class InsertDepensesFuncEvent extends DepensesEvent {
  final String createdBy;
  final String inputValueDepensesAchatEau;
  final int idIndicateurDepensesAchatEau;
  final String inputValueDepensesEnergie;
  final int idIndicateurDepensesEnergie;
  final String inputValueDepensesSalairesPrimes;
  final int idIndicateurDepensesSalairesPrimes;
  final String inputValueDepensesMaintenanceEntretien;
  final int idIndicateurDepensesMaintenanceEntretien;
  final String inputValueDepensesLocation;
  final int idIndicateurDepensesLocation;
  final String inputValueDepensesRenouvellement;
  final int idIndicateurDepensesRenouvellement;
  final String inputValueDepensesGestionGDA;
  final int idIndicateurDepensesGestionGDA;
  final String inputValueDepensesInvestissement;
  final int idIndicateurDepensesInvestissement;
  final String inputValueAutresDepenses;
  final int idIndicateurAutresDepenses;
  final int idSaisie;
  final int month;
  final int year;
  const InsertDepensesFuncEvent._(
    this.createdBy,
    this.inputValueDepensesAchatEau,
    this.idIndicateurDepensesAchatEau,
    this.inputValueDepensesEnergie,
    this.idIndicateurDepensesEnergie,
    this.inputValueDepensesSalairesPrimes,
    this.idIndicateurDepensesSalairesPrimes,
    this.inputValueDepensesMaintenanceEntretien,
    this.idIndicateurDepensesMaintenanceEntretien,
    this.inputValueDepensesLocation,
    this.idIndicateurDepensesLocation,
    this.inputValueDepensesRenouvellement,
    this.idIndicateurDepensesRenouvellement,
    this.inputValueDepensesGestionGDA,
    this.idIndicateurDepensesGestionGDA,
    this.inputValueDepensesInvestissement,
    this.idIndicateurDepensesInvestissement,
    this.inputValueAutresDepenses,
    this.idIndicateurAutresDepenses,
    this.idSaisie,
    this.month,
    this.year,
  ) : super._();
  @override
  List<Object?> get props => [
        createdBy,
        inputValueDepensesAchatEau,
        idIndicateurDepensesAchatEau,
        inputValueDepensesEnergie,
        idIndicateurDepensesEnergie,
        inputValueDepensesSalairesPrimes,
        idIndicateurDepensesSalairesPrimes,
        inputValueDepensesMaintenanceEntretien,
        idIndicateurDepensesMaintenanceEntretien,
        inputValueDepensesLocation,
        idIndicateurDepensesLocation,
        inputValueDepensesRenouvellement,
        idIndicateurDepensesRenouvellement,
        inputValueDepensesGestionGDA,
        idIndicateurDepensesGestionGDA,
        inputValueDepensesInvestissement,
        idIndicateurDepensesInvestissement,
        inputValueAutresDepenses,
        idIndicateurAutresDepenses,
        idSaisie,
        month,
        year,
      ];
}
