import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/utils/constants.dart';
import 'package:http/http.dart' as http;

part 'depenses_events.dart';
part 'depenses_states.dart';

class DepensesBloc extends Bloc<DepensesEvent, DepensesState> {
  DepensesBloc() : super(const InitialDepensesState._()) {
    on<InsertDepensesFuncEvent>(_insert);
  }
  Future<void> _insert(
    InsertDepensesFuncEvent event,
    Emitter<DepensesState> emitter,
  ) async {
    var url = Uri.http(link, 'depenses');
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"createdby": "${event.createdBy}", "inputvaluedepensesachateau" : "${event.inputValueDepensesAchatEau}" , "idindicateurdepensesachateau": "${event.idIndicateurDepensesAchatEau}","inputvaluedepensesenergie": "${event.inputValueDepensesEnergie}","idindicateurdepensesenergie": "${event.idIndicateurDepensesEnergie}" , "inputvaluedepensessalairesprimes": "${event.inputValueDepensesSalairesPrimes}","idindicateurdepensessalairesprimes": "${event.idIndicateurDepensesSalairesPrimes}","inputvaluedepensesmaintenanceentretien": "${event.inputValueDepensesMaintenanceEntretien}","idindicateurdepensesmaintenanceentretien": "${event.idIndicateurDepensesMaintenanceEntretien}","inputvaluedepenseslocation": "${event.inputValueDepensesLocation}","idindicateurdepenseslocation": "${event.idIndicateurDepensesLocation}","inputvaluedepensesrenouvellement": "${event.inputValueDepensesRenouvellement}","idindicateurdepensesrenouvellement": "${event.idIndicateurDepensesRenouvellement}","inputvaluedepensesgestiongda": "${event.inputValueDepensesGestionGDA}","idindicateurdepensesgestiongda": "${event.idIndicateurDepensesGestionGDA}","inputvaluedepensesinvestissement": "${event.inputValueDepensesInvestissement}","idindicateurdepensesinvestissement": "${event.idIndicateurDepensesInvestissement}","inputvalueautresdepenses": "${event.inputValueAutresDepenses}","idindicateurautresdepenses": "${event.idIndicateurAutresDepenses}","idsaisie": "${event.idSaisie}","month": "${event.month}","year": "${event.year}"}';
    await http.post(url, headers: headers, body: json);
  }

  void insertDonneesTechniques({
    required String createdBy,
    required String inputValueDepensesAchatEau,
    required int idIndicateurDepensesAchatEau,
    required String inputValueDepensesEnergie,
    required int idIndicateurDepensesEnergie,
    required String inputValueDepensesSalairesPrimes,
    required int idIndicateurDepensesSalairesPrimes,
    required String inputValueDepensesMaintenanceEntretien,
    required int idIndicateurDepensesMaintenanceEntretien,
    required String inputValueDepensesLocation,
    required int idIndicateurDepensesLocation,
    required String inputValueDepensesRenouvellement,
    required int idIndicateurDepensesRenouvellement,
    required String inputValueDepensesGestionGDA,
    required int idIndicateurDepensesGestionGDA,
    required String inputValueDepensesInvestissement,
    required int idIndicateurDepensesInvestissement,
    required String inputValueAutresDepenses,
    required int idIndicateurAutresDepenses,
    required int idSaisie,
    required int month,
    required int year,
  }) {
    add(InsertDepensesFuncEvent._(
      createdBy,
      inputValueDepensesAchatEau,
      idIndicateurDepensesAchatEau,
      inputValueDepensesEnergie,
      idIndicateurDepensesEnergie,
      inputValueDepensesSalairesPrimes,
      idIndicateurDepensesSalairesPrimes,
      inputValueDepensesMaintenanceEntretien,
      idIndicateurDepensesMaintenanceEntretien,
      inputValueDepensesLocation,
      idIndicateurDepensesLocation,
      inputValueDepensesRenouvellement,
      idIndicateurDepensesRenouvellement,
      inputValueDepensesGestionGDA,
      idIndicateurDepensesGestionGDA,
      inputValueDepensesInvestissement,
      idIndicateurDepensesInvestissement,
      inputValueAutresDepenses,
      idIndicateurAutresDepenses,
      idSaisie,
      month,
      year,
    ));
  }
}
