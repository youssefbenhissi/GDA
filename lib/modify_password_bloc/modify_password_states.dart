part of 'modify_password_bloc.dart';

@immutable
abstract class ModifyPasswordState extends Equatable {
  const ModifyPasswordState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialModifyPasswordState extends ModifyPasswordState {
  const InitialModifyPasswordState._() : super._();
}

@immutable
class SuccededModifyPasswordState extends ModifyPasswordState {
  const SuccededModifyPasswordState._() : super._();
}

@immutable
class FailedModifyPasswordState extends ModifyPasswordState {
  const FailedModifyPasswordState._() : super._();
}
