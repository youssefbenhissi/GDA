class SpecificFicheGDAModel {
  final int idGouv;
  final String nomGouvernoratFrancais;
  final String nomGouvernoratArabe;
  final int idDelegation;
  final String code; //gda_id
  final int month;
  final int year;
  final String volumePompe;
  final String volumeDistribue;
  final String volumeEauJavel;
  final String tarifAdapte;
  final String coutEauText;
  final String nombreJour;
  final String recetteVente;
  final String recetteAdhesion;
  final String recetteAbonnement;
  final String recetteCotisation;
  final String autresRecettes;
  final String depensesAchatEau;
  final String depensesEnergie;
  final String depensesSalairesEtPrimes;
  final String depensesMaintenaceEtEntretien;
  final String depensesLocation;
  final String depensesRenouvellementDesEquipement;
  final String depensesGestionDGA;
  final String depensesDInvestissement;
  final String depensesAutresDepenses;
  SpecificFicheGDAModel(
    this.idGouv,
    this.nomGouvernoratFrancais,
    this.nomGouvernoratArabe,
    this.idDelegation,
    this.code,
    this.month,
    this.year,
    this.volumePompe,
    this.volumeDistribue,
    this.volumeEauJavel,
    this.tarifAdapte,
    this.coutEauText,
    this.nombreJour,
    this.recetteVente,
    this.recetteAdhesion,
    this.recetteAbonnement,
    this.recetteCotisation,
    this.autresRecettes,
    this.depensesAchatEau,
    this.depensesEnergie,
    this.depensesSalairesEtPrimes,
    this.depensesMaintenaceEtEntretien,
    this.depensesLocation,
    this.depensesRenouvellementDesEquipement,
    this.depensesGestionDGA,
    this.depensesDInvestissement,
    this.depensesAutresDepenses,
  );
}

class NewSpecificFicheGdaModel {
  final String rgdArabe;
  final String rgdFrancais;
  final String code;
  final int idDelegation;
  final String refDelegationArabe;
  final String refDelegationFrancais;
  final int rgoid;
  final String libAr;
  final String libFr;
  NewSpecificFicheGdaModel(
    this.rgdArabe,
    this.rgdFrancais,
    this.code,
    this.idDelegation,
    this.refDelegationArabe,
    this.refDelegationFrancais,
    this.rgoid,
    this.libAr,
    this.libFr,
  );
  static NewSpecificFicheGdaModel getSpecificFicheGDAModel(List<dynamic> json) {
    List<NewSpecificFicheGdaModel> list = [];
    for (var item in json) {
      list.add(NewSpecificFicheGdaModel.fromJson(item));
    }
    return list.first;
  }

  factory NewSpecificFicheGdaModel.fromJson(Map<String, dynamic> json) {
    return NewSpecificFicheGdaModel(
      json['rgdarabe'] as String,
      json['rgdfrancais'] as String,
      json['rgdcode'] as String,
      json['iddelegation'] as int,
      json['refdelegationarabe'] as String,
      json['refdelegationfrancais'] as String,
      json['rgoid'] as int,
      json['lib_ar'] as String,
      json['lib_fr'] as String,
    );
  }
}
