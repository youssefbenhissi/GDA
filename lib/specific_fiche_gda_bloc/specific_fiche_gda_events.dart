part of 'specific_fiche_gda_bloc.dart';

abstract class SpecificFicheGDAEvent extends Equatable {
  const SpecificFicheGDAEvent._();

  @override
  List<Object?> get props => [];
}

@immutable
class LoadSpecificGDAFuncEvent extends SpecificFicheGDAEvent {
  final String login;
  final int month;
  final int year;
  final String gda;
  const LoadSpecificGDAFuncEvent._(this.login, this.month, this.year, this.gda)
      : super._();
  @override
  List<Object?> get props => [login, month, year, gda];
}
