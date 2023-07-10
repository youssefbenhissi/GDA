import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    String url = link + '/getdonneesidentification';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"login": "${event.login}"}';
    http.Response response = await http.post(url, headers: headers, body: json);
    var i = jsonDecode(response.body);
    print(i["id_gda"]);
  }

  void loadGDA(String login) {
    add(LoadGDAFuncEvent._(login));
  }
}
