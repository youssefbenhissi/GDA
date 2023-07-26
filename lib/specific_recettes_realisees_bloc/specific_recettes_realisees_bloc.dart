import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/indicateur_bloc/indicateur_model.dart';
import 'package:http/http.dart' as http;
import 'package:pfe_iheb/utils/constants.dart';

part 'specific_recettes_realisees_events.dart';
part 'specific_recettes_realisees_states.dart';

class SpecificRecettesRealiseesBloc extends Bloc<SpecificRecettesRealiseesEvent,
    SpecificRecettesRealiseesState> {
  SpecificRecettesRealiseesBloc()
      : super(const InitialSpecificRecettesRealiseesState._()) {
    on<LoadSpecificRecettesRealiseesFuncEvent>(_load);
  }
  Future<void> _load(
    LoadSpecificRecettesRealiseesFuncEvent event,
    Emitter<SpecificRecettesRealiseesState> emitter,
  ) async {
    emitter(const LoadingSpecificRecettesRealiseesState._());
    List<IndicateurModel> models = [];
    String url = '$link/specificrecettevente';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"gda": "${event.gda}","month":"${event.month}","year":"${event.year}"}';
    http.Response response = await http.post(url, headers: headers, body: json);
    IndicateurModel model =
        IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);

    url = '$link/specificrecetteadhesion';
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);

    url = '$link/specificrecettecotisation';
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);

    url = '$link/specificautresrecettes';
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    emitter(LoadedSpecificRecettesRealiseesState._(models));
  }

  void loadSpecificRecettesRealisees(String gda, int month, int year) {
    add(LoadSpecificRecettesRealiseesFuncEvent._(gda, month, year));
  }
}
