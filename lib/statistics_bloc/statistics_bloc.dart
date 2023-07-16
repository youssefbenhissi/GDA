import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/statistics_bloc/statistics_model.dart';
import 'package:pfe_iheb/utils/constants.dart';
import 'package:http/http.dart' as http;

part 'statistics_states.dart';
part 'statitics_events.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc() : super(const InitialStaticsState._()) {
    on<LoadStatisticsFuncEvent>(_load);
  }
  Future<void> _load(
    LoadStatisticsFuncEvent event,
    Emitter<StatisticsState> emitter,
  ) async {
    emitter(const LoadingStaticsState._());
    List<StaticsModel> models = [];
    String url = '$link/tauxdepertestatistics';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"login": "${event.login}"}';
    http.Response response = await http.post(url, headers: headers, body: json);
    StaticsModel model =
        StaticsModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);

    url = '$link/consommationspecifiquestatics';
    response = await http.post(url, headers: headers, body: json);
    model = StaticsModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);

    url = '$link/consommationspecifiqueeaudejavelstatics';
    response = await http.post(url, headers: headers, body: json);
    model = StaticsModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);

    url = '$link/recettemoyennestatics';
    response = await http.post(url, headers: headers, body: json);
    model = StaticsModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);

    emitter(LoadedStatiticsState._(models));
  }

  void loadStatistics(String login) {
    add(LoadStatisticsFuncEvent._(login));
  }
}
