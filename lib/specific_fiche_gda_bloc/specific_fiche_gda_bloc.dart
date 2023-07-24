import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:pfe_iheb/specific_fiche_gda_bloc/specific_fiche_gda_model.dart';
import 'package:pfe_iheb/utils/constants.dart';

part 'specific_fiche_gda_states.dart';
part 'specific_fiche_gda_events.dart';

class SpecificFicheGDABloc
    extends Bloc<SpecificFicheGDAEvent, SpecificFicheGDAState> {
  SpecificFicheGDABloc() : super(const InitialSpecificFicheGDAState._()) {
    on<LoadSpecificGDAFuncEvent>(_load);
  }
  Future<void> _load(
    LoadSpecificGDAFuncEvent event,
    Emitter<SpecificFicheGDAState> emitter,
  ) async {
    emitter(const LoadingSpecificFicheGDAState._());
    String url = '$link/getspecificdonneesidentification';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"gda": "${event.gda}","month" : "${event.month}","year":"${event.year}","gda":"${event.gda}"}';
    http.Response response = await http.post(url, headers: headers, body: json);
    if (response.statusCode == 400) {
      emitter(const FailedSpecificFicheGDAState._());
    } else if (response.statusCode == 200) {
      NewSpecificFicheGdaModel model =
          NewSpecificFicheGdaModel.getSpecificFicheGDAModel(
              jsonDecode(response.body));
      emitter(LoadedSpecificFicheGDAState._(model));
    }
  }

  void loadSpecificGDA(String login, int month, int year, String gda) {
    add(LoadSpecificGDAFuncEvent._(login, month, year, gda));
  }
}
