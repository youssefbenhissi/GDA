import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'consultation_screen_events.dart';
part 'consultation_screen_states.dart';

class ConsultationScreenBloc
    extends Bloc<ConsultationScreenEvent, ConsultationScreenState> {
  ConsultationScreenBloc() : super(const InitialConsultationScreenState._()) {
    on<MonthAndYearFieldsEvent>(_choseMonthAndYear);
    on<AllFieldsEvent>(_choseAllfields);
  }
  void _choseMonthAndYear(
    MonthAndYearFieldsEvent event,
    Emitter<ConsultationScreenState> emitter,
  ) {
    emitter(const MonthAndYearChosenState._());
  }

  void _choseAllfields(
    AllFieldsEvent event,
    Emitter<ConsultationScreenState> emitter,
  ) {
    emitter(const AllFieldsChosenState._());
  }

  void choseMonthAndYear(String month, String year) {
    add(MonthAndYearFieldsEvent._(month, year));
  }

  void choseAllfields(String month, String year, String gda) {
    add(AllFieldsEvent._(month, year, gda));
  }
}
