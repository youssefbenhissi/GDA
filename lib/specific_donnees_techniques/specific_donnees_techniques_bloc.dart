import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/indicateur_bloc/indicateur_model.dart';
import 'package:pfe_iheb/utils/constants.dart';
import 'package:http/http.dart' as http;

part 'specific_donnees_techniques_events.dart';
part 'specific_donnees_techniques_states.dart';

class SpecificDonneesTechniquesBloc extends Bloc<SpecificDonneesTechniquesEvent,
    SpecificDonneesTechniquesState> {
  SpecificDonneesTechniquesBloc()
      : super(const InitialSpecificDonneesTechniquesState._()) {
    on<LoadSpecificDonneesTechniquesFuncEvent>(_load);
  }
  Future<void> _load(
    LoadSpecificDonneesTechniquesFuncEvent event,
    Emitter<SpecificDonneesTechniquesState> emitter,
  ) async {
    emitter(const LoadingSpecificDonneesTechniquesState._());
    List<IndicateurModel> models = [];
    var url = Uri.http(link, 'volumepompe');
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"gda": "${event.gda}","month":"${event.month}","year":"${event.year}"}';
    http.Response response = await http.post(url, headers: headers, body: json);
    IndicateurModel model =
        IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    url = Uri.http(link, 'volumedistribue');
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    url = Uri.http(link, 'volumeeaujavel');
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    url = Uri.http(link, 'tarifadapte');
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    url = Uri.http(link, 'couteau');
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    url = Uri.http(link, 'nombredejourarret');
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    emitter(LoadedSpecificDonneesTechniquesState._(models));
  }

  void loadSpecificDonneesTechniques(String gda, int month, int year) {
    add(LoadSpecificDonneesTechniquesFuncEvent._(gda, month, year));
  }
}
