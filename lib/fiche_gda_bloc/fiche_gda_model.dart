// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class FicheGDAModel {
  final int idGouv;
  final String nomGouvFr; // nom gouv
  final String nomGouvAr; // nom gouv
  final int idDelegation;
  final String code; //gda_id
  String? dateCreation;
  String? nomPresident;
  String? telPresident;
  String? nomDirTechnique;
  String? telDirTechnique;
  String? nomSaep;
  String? dateMiseService;
  int? srcEauForage;
  int? srcEauPiquageSonede;
  int? srcEauPiquageGr;
  int? srcEauPuit;
  int? srcEauSourceNaturelle;
  int? nbBeneficiaires;
  int? longueurReseau;
  int? nbStationsPompage;
  int? nbReservoirs;
  int? nbBi;
  int? nbBep;
  final String refdelegationfrancais;
  final String refdelegationarabe;
  final String rgdarabe;
  final String rgdfrancais;
  FicheGDAModel(
    this.idGouv,
    this.nomGouvFr,
    this.nomGouvAr,
    this.idDelegation,
    this.code,
    this.dateCreation,
    this.nomPresident,
    this.telPresident,
    this.nomDirTechnique,
    this.telDirTechnique,
    this.nomSaep,
    this.dateMiseService,
    this.srcEauForage,
    this.srcEauPiquageSonede,
    this.srcEauPiquageGr,
    this.srcEauPuit,
    this.srcEauSourceNaturelle,
    this.nbBeneficiaires,
    this.longueurReseau,
    this.nbStationsPompage,
    this.nbReservoirs,
    this.nbBi,
    this.nbBep,
    this.refdelegationfrancais,
    this.refdelegationarabe,
    this.rgdarabe,
    this.rgdfrancais,
  );
  static DateFormat formatter = DateFormat('yyyy-MM-dd');
  static FicheGDAModel getFicheGDAModel(List<dynamic> json) {
    List<FicheGDAModel> list = [];
    for (var item in json) {
      list.add(FicheGDAModel.fromJson(item));
    }
    return list.first;
  }

  factory FicheGDAModel.fromJson(Map<String, dynamic> json) {
    return FicheGDAModel(
      json['id_gouv'] as int,
      json['lib_fr'] as String,
      json['lib_ar'] as String,
      json['id_delegation'] as int,
      json['code'] as String,
      json['date_creation'] != null
          ? formatter.format(
              DateTime.parse(
                json['date_creation'].toString(),
              ),
            )
          : '',
      json['nom_president'] ?? '',
      json['tel_president'] ?? '',
      json['nom_dir_technique'] ?? '',
      json['tel_dir_technique'] ?? '',
      json['nom_saep'] ?? '',
      json['date_mise_service'] != null
          ? formatter.format(
              DateTime.parse(
                json['date_creation'].toString(),
              ),
            )
          : '',
      json['src_eau_forage'] ?? 0,
      json['src_eau_piquage_sonede'] ?? 0,
      json['src_eau_piquage_gr'] ?? 0,
      json['src_eau_puit'] ?? 0,
      json['src_eau_source_naturelle'] ?? 0,
      json['nb_beneficiaires'] ?? 0,
      json['longueur_reseau'] ?? 0,
      json['nb_stations_pompage'] ?? 0,
      json['nb_reservoirs'] ?? 0,
      json['nb_bi'] ?? 0,
      json['nb_bep'] ?? 0,
      json["refdelegationfrancais"] ?? "",
      json["refdelegationarabe"] ?? "",
      json["rgdarabe"] ?? "",
      json["rgdfrancais"] ?? "",
    );
  }
}
