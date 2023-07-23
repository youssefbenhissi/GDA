import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/statistics_bloc/statistics_model.dart';
import 'package:pfe_iheb/utils/constants.dart';
// ignore: import_of_legacy_library_into_null_safe
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
    List<StaticsModel> model =
        StaticsModel.getIndicateurModel(jsonDecode(response.body));
    for (StaticsModel m in model) {
      models.add(m);
    }

    url = '$link/consommationspecifiquestatics';
    response = await http.post(url, headers: headers, body: json);
    model = StaticsModel.getIndicateurModel(jsonDecode(response.body));
    for (StaticsModel m in model) {
      models.add(m);
    }

    url = '$link/consommationspecifiqueeaudejavelstatics';
    response = await http.post(url, headers: headers, body: json);
    model = StaticsModel.getIndicateurModel(jsonDecode(response.body));
    for (StaticsModel m in model) {
      models.add(m);
    }

    url = '$link/recettemoyennestatics';
    response = await http.post(url, headers: headers, body: json);
    model = StaticsModel.getIndicateurModel(jsonDecode(response.body));
    for (StaticsModel m in model) {
      models.add(m);
    }
    Map<String, List<double>> modelMap = models.fold(
      {},
      (Map<String, List<double>> map, StaticsModel model) {
        if (map.containsKey(model.date)) {
          map[model.date]!.add(model.inputValue);
        } else {
          map[model.date] = [model.inputValue];
        }
        return map;
      },
    );
    emitter(LoadedStatiticsState._(modelMap));
  }

  void loadStatistics(String login) {
    add(LoadStatisticsFuncEvent._(login));
  }
}
