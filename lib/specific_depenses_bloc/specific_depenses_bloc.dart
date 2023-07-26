import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/indicateur_bloc/indicateur_model.dart';
import 'package:http/http.dart' as http;
import 'package:pfe_iheb/utils/constants.dart';

part 'specific_depenses_events.dart';
part 'specific_depenses_states.dart';

class SpecificDepensesBloc
    extends Bloc<SpecificDepensesEvent, SpecificDepensesState> {
  SpecificDepensesBloc() : super(const InitialSpecificDepensesState._()) {
    on<LoadSpecificDepensesFuncEvent>(_load);
  }
  Future<void> _load(
    LoadSpecificDepensesFuncEvent event,
    Emitter<SpecificDepensesState> emitter,
  ) async {
    emitter(const LoadingSpecificDepensesState._());
    List<IndicateurModel> models = [];
    String url = '$link/volumepompe';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"gda": "${event.gda}","month":"${event.month}","year":"${event.year}"}';
    http.Response response = await http.post(url, headers: headers, body: json);
    IndicateurModel model =
        IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);

    url = '$link/volumedistribue';
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);

    url = '$link/volumeeaujavel';
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);

    url = '$link/tarifadapte';
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);

    url = '$link/couteau';
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    url = '$link/nombredejourarret';
    response = await http.post(url, headers: headers, body: json);
    model = IndicateurModel.getIndicateurModel(jsonDecode(response.body));
    models.add(model);
    emitter(LoadedSpecificDepensesState._(models));
  }

  void loadSpecificRecettesRealisees(String gda, int month, int year) {
    add(LoadSpecificDepensesFuncEvent._(gda, month, year));
  }
}
