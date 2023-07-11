part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialLoginState extends LoginState {
  const InitialLoginState._() : super._();
}

@immutable
class FailedLoginState extends LoginState {
  const FailedLoginState._() : super._();
}

@immutable
class GDALoginState extends LoginState {
  final User model;
  const GDALoginState._(this.model) : super._();
}

@immutable
class DecideurGouvernoratLoginState extends LoginState {
  final User model;
  const DecideurGouvernoratLoginState._(this.model) : super._();
}

@immutable
class DecideurCentralLoginState extends LoginState {
  final User model;
  const DecideurCentralLoginState._(this.model) : super._();
}
