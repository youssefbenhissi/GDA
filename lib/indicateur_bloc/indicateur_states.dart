part of 'indicateur_bloc.dart';

@immutable
abstract class IndicateurState extends Equatable {
  const IndicateurState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialIndicateurState extends IndicateurState {
  const InitialIndicateurState._() : super._();
}
