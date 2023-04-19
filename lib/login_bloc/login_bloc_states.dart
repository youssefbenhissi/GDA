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
  const GDALoginState._() : super._();
}

@immutable
class DecideurGouvernoratLoginState extends LoginState {
  const DecideurGouvernoratLoginState._() : super._();
}

@immutable
class DecideurCentralLoginState extends LoginState {
  const DecideurCentralLoginState._() : super._();
}
