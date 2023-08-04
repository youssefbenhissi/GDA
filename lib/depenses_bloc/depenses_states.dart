part of 'depenses_bloc.dart';

@immutable
abstract class DepensesState extends Equatable {
  const DepensesState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialDepensesState extends DepensesState {
  const InitialDepensesState._() : super._();
}
