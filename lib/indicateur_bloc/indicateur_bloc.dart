import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/indicateur_bloc/indicateur_model.dart';
import 'package:pfe_iheb/utils/constants.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

part 'indicateur_events.dart';
part 'indicateur_states.dart';

class IndicateurBloc extends Bloc<IndicateurEvent, IndicateurState> {
  IndicateurBloc() : super(const InitialIndicateurState._()) {
    on<LoadIndicateurFuncEvent>(_load);
  }
  Future<void> _load(
    LoadIndicateurFuncEvent event,
    Emitter<IndicateurState> emitter,
  ) async {
    emitter(const LoadingIndicateurState._());
    List<IndicateurModel> models = [];
    var url = Uri.http(link, 'tauxdeperte');
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"login": "${event.login}"}';
    http.Response response = await http.post(url, headers: headers, body: json);
    IndicateurModel model =
        IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    url = Uri.http(link, 'tauxderecouvrement');
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    url = Uri.http(link, 'consommationspecifique');
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    url = Uri.http(link, 'consommationspecifiqueeaudejavel');
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    url = Uri.http(link, 'recettemoyenne');
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    url = Uri.http(link, 'nombredejourarret');
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    emitter(LoadedIndicateurState._(models));
  }

  void loadIndicateur(String login) {
    add(LoadIndicateurFuncEvent._(login));
  }
}
