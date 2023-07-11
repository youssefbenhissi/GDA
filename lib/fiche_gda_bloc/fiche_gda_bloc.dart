import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/fiche_gda_bloc/fiche_gda_model.dart';
import 'package:pfe_iheb/utils/constants.dart';
import 'package:http/http.dart' as http;

part 'fiche_gda_events.dart';
part 'fiche_gda_states.dart';

class FicheGDABloc extends Bloc<FicheGDAEvent, FicheGDAState> {
  FicheGDABloc() : super(const InitialFicheGDAState._()) {
    on<LoadGDAFuncEvent>(_load);
  }
  Future<void> _load(
    LoadGDAFuncEvent event,
    Emitter<FicheGDAState> emitter,
  ) async {
    emitter(const LoadingFicheGDAState._());
    String url = link + '/getdonneesidentification';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"login": "${event.login}"}';
    http.Response response = await http.post(url, headers: headers, body: json);
    if (response.statusCode == 400) {
      emitter(const FailedFicheGDAState._());
    } else if (response.statusCode == 200) {
      FicheGDAModel model = FicheGDAModel.fromJson(jsonDecode(response.body));
      emitter(LoadedFicheGDAState._(model));
    }
    emitter(const FailedFicheGDAState._());
  }

  void loadGDA(String login) {
    add(LoadGDAFuncEvent._(login));
  }
}
