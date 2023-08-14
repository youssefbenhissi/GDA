import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/utils/constants.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

part 'recettes_realisees_events.dart';
part 'recettes_realisees_states.dart';

class RecettesRealiseesBloc
    extends Bloc<RecettesRealiseesEvent, RecettesRealiseesState> {
  RecettesRealiseesBloc() : super(const InitialRecettesRealiseesState._()) {
    on<InsertRecettesRealiseesFuncEvent>(_insert);
  }
  Future<void> _insert(
    InsertRecettesRealiseesFuncEvent event,
    Emitter<RecettesRealiseesState> emitter,
  ) async {
    var url = Uri.http(link, 'recettesrealisees');
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"createdby": "${event.createdBy}", "inputvaluerecettesventeeau" : "${event.inputValueRecettesVenteEau}" , "idindicateurrecettesventeeau": "${event.idIndicateurRecettesVenteEau}","inputvaluerecettesadhesion": "${event.inputValueRecettesAdhesion}","idindicateurrecettesadhesion": "${event.idIndicateurRecettesAdhesion}" , "inputvaluerecettesabonnement": "${event.inputValueRecettesAbonnement}","idindicateurrecettesabonnement": "${event.idIndicateurRecettesAbonnement}","inputvaluerecettescotisations": "${event.inputValueRecettesCotisations}","idindicateurrecettescotisations": "${event.idIndicateurRecettesCotisations}","inputvalueautresrecettes": "${event.inputValueAutresRecettes}","idindicateurautresrecettes": "${event.idIndicateurAutresRecettes}","idsaisie": "${event.idSaisie}","month": "${event.month}","year": "${event.year}"}';
    await http.post(url, headers: headers, body: json);
  }

  void insertRecettesRealisees({
    required String createdBy,
    required String inputValueRecettesVenteEau,
    required int idIndicateurRecettesVenteEau,
    required String inputValueRecettesAdhesion,
    required int idIndicateurRecettesAdhesion,
    required String inputValueRecettesAbonnement,
    required int idIndicateurRecettesAbonnement,
    required String inputValueRecettesCotisations,
    required int idIndicateurRecettesCotisations,
    required String inputValueAutresRecettes,
    required int idIndicateurAutresRecettes,
    required int idSaisie,
    required int month,
    required int year,
  }) {
    add(InsertRecettesRealiseesFuncEvent._(
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
        year));
  }
}
