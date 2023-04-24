import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'consultation_screen_events.dart';
part 'consultation_screen_states.dart';

class ConsultationScreenBloc
    extends Bloc<ConsultationScreenEvent, ConsultationScreenState> {
  ConsultationScreenBloc() : super(const InitialConsultationScreenState._()) {}
}
