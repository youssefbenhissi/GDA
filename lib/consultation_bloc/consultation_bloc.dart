import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'consultation_events.dart';
part 'consultation_states.dart';

class ConsultationBloc extends Bloc<ConsultationEvent, ConsultationState> {
  ConsultationBloc() : super(const InitialConsultationState._()) {
    
  }
}
