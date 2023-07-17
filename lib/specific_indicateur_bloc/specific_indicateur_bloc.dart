import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/indicateur_bloc/indicateur_model.dart';
import 'package:pfe_iheb/utils/constants.dart';
import 'package:http/http.dart' as http;

part 'specific_indicateur_events.dart';
part 'specific_indicateur_states.dart';

class SpecificIndicateurBloc
    extends Bloc<SpecificIndicateurEvent, SpecificIndicateurState> {
  SpecificIndicateurBloc() : super(const InitialSpecificIndicateurState._()) {
    on<LoadSpecificIndicateurFuncEvent>(_load);
  }

  Future<void> _load(
    LoadSpecificIndicateurFuncEvent event,
    Emitter<SpecificIndicateurState> emitter,
  ) async {
    emitter(const LoadingSpecificIndicateurState._());
    List<IndicateurModel> models = [];
    String url = '$link/specifiqueindicateurtauxdeperte';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"login": "${event.login}","month": "${event.month}","year": "${event.year}"}';
    http.Response response = await http.post(url, headers: headers, body: json);
    IndicateurModel model =
        IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    url = '$link/specifiqueindicateurtauxderecouvrement';
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);

    url = '$link/specifiqueindicateurconsommationspecifique';
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);

    url = '$link/specifiqueindicateurconsommationspecifiqueeaudejavel';
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);

    url = '$link/specifiqueindicateurrecettemoyenne';
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    url = '$link/specifiqueindicateurnombredejourarret';
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    emitter(LoadedSpecificIndicateurState._(models));
  }

  void loadSpecifiqueIndicateur(String login, int month, int year) {
    add(LoadSpecificIndicateurFuncEvent._(login, month, year));
  }
}
