part of 'indicateur_bloc.dart';

abstract class IndicateurEvent extends Equatable {
  const IndicateurEvent._();
  @override
  List<Object?> get props => [];
}

@immutable
class LoadIndicateurFuncEvent extends IndicateurEvent {
  final String login;
  const LoadIndicateurFuncEvent._(this.login) : super._();
  @override
  List<Object?> get props => [login];
}
