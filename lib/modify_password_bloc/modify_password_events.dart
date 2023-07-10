part of 'modify_password_bloc.dart';

abstract class ModifyPasswordEvent extends Equatable {
  const ModifyPasswordEvent._();

  @override
  List<Object?> get props => [];
}

@immutable
class ModifyPasswordFuncEvent extends ModifyPasswordEvent {
  final String username;
  final String password;
  const ModifyPasswordFuncEvent._(this.username, this.password) : super._();
  @override
  List<Object?> get props => [username, password];
}
