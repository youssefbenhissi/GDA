part of 'specific_indicateur_bloc.dart';

abstract class SpecificIndicateurEvent extends Equatable {
  const SpecificIndicateurEvent._();
  @override
  List<Object?> get props => [];
}

@immutable
class LoadSpecificIndicateurFuncEvent extends SpecificIndicateurEvent {
  final String login;
  final int month;
  final int year;
  const LoadSpecificIndicateurFuncEvent._(this.login, this.month, this.year)
      : super._();
  @override
  List<Object?> get props => [login];
}
