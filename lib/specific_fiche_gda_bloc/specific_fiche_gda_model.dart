import 'package:intl/intl.dart';

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
  );
}
