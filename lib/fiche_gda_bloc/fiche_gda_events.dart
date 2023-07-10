part of 'fiche_gda_bloc.dart';

abstract class FicheGDAEvent extends Equatable {
  const FicheGDAEvent._();

  @override
  List<Object?> get props => [];
}

@immutable
class LoadGDAFuncEvent extends FicheGDAEvent {
  final String login;
  const LoadGDAFuncEvent._(this.login) : super._();
  @override
  List<Object?> get props => [login];
}
