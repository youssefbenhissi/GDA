part of 'specific_depenses_bloc.dart';

@immutable
abstract class SpecificDepensesState extends Equatable {
  const SpecificDepensesState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialSpecificDepensesState extends SpecificDepensesState {
  const InitialSpecificDepensesState._() : super._();
}

@immutable
class LoadingSpecificDepensesState extends SpecificDepensesState {
  const LoadingSpecificDepensesState._() : super._();
}

@immutable
class LoadedSpecificDepensesState extends SpecificDepensesState {
  final List<IndicateurModel> models;
  const LoadedSpecificDepensesState._(this.models) : super._();

  @override
  List<Object?> get props => [models];
}

@immutable
class FailedSpecificDepensesState extends SpecificDepensesState {
  const FailedSpecificDepensesState._() : super._();
}
