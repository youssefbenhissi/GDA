import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/utils/constants.dart';
import 'package:http/http.dart' as http;

part 'donnees_techniques_events.dart';
part 'donnees_techniques_states.dart';

class DonneesTechniquesBloc
    extends Bloc<DonneesTechniquesEvent, DonneesTechniquesState> {
  DonneesTechniquesBloc() : super(const InitialDonnesTechniquesState._()) {
    on<InsertDonneesTechniquesFuncEvent>(_insert);
  }
  Future<void> _insert(
    InsertDonneesTechniquesFuncEvent event,
    Emitter<DonneesTechniquesState> emitter,
  ) async {
    String url = '$link/donneestechniques';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"createdby": "${event.createdBy},"inputvaluevolumepompe": "${event.inputValueVolumePompe},"idindicateurvolumepompe": "${event.idIndicateurVolumePompe},"inputvaluevolumedistribue": "${event.inputValueVolumeDistribue},"idindicateurvolumedistribue": "${event.idIndicateurVolumeDistribue},"inputvaluevolumeeaudejavel": "${event.inputValueVolumeEauDeJavel},"idindicateurvolumeeaudejavel": "${event.idIndicateurVolumeEauDeJavel},"inputvaluetarifadopte": "${event.inputValueTarifAdopte},"idindicateurtarifadopte": "${event.idIndicateurTarifAdopte},"inputvaluecouteau": "${event.inputValueCoutEau},"idindicateurcouteau": "${event.idIndicateurCoutEau},"inputvaluenombredejoursarret": "${event.inputValueNombreDeJoursArret},"idindicateur": "${event.idIndicateur},"idsaisie": "${event.idSaisie},"month": "${event.month},"year": "${event.year}"}';
    await http.post(url, headers: headers, body: json);
  }

  void insertDonneesTechniques(
      {required String createdBy,
      required String inputValueVolumePompe,
      required int idIndicateurVolumePompe,
      required String inputValueVolumeDistribue,
      required int idIndicateurVolumeDistribue,
      required String inputValueVolumeEauDeJavel,
      required int idIndicateurVolumeEauDeJavel,
      required String inputValueTarifAdopte,
      required int idIndicateurTarifAdopte,
      required String inputValueCoutEau,
      required int idIndicateurCoutEau,
      required String inputValueNombreDeJoursArret,
      required int idIndicateur,
      required int idSaisie,
      required int month,
      required int year}) {
    add(InsertDonneesTechniquesFuncEvent._(
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
        year));
  }
}
