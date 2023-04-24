import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'specific_indicateur_events.dart';
part 'specific_indicateur_states.dart';

class SpecificIndicateurBloc
    extends Bloc<SpecificIndicateurEvent, SpecificIndicateurState> {
  SpecificIndicateurBloc() : super(const InitialSpecificIndicateurState._()) {}
}
