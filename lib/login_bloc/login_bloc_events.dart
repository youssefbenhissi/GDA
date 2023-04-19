part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent._();

  @override
  List<Object?> get props => [];
}

@immutable
class LoginFuncEvent extends LoginEvent {
  final String username;
  final String password;
  const LoginFuncEvent._(this.username, this.password) : super._();
  @override
  List<Object?> get props => [username, password];
}
