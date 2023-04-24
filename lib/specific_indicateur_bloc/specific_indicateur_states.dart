part of 'specific_indicateur_bloc.dart';

@immutable
abstract class SpecificIndicateurState extends Equatable {
  const SpecificIndicateurState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialSpecificIndicateurState extends SpecificIndicateurState {
  const InitialSpecificIndicateurState._() : super._();
}
