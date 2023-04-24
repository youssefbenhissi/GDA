import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'indicateur_events.dart';
part 'indicateur_states.dart';

class IndicateurBloc extends Bloc<IndicateurEvent, IndicateurState> {
  IndicateurBloc() : super(const InitialIndicateurState._()) {}
}
