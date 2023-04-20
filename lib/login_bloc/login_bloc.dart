import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'login_bloc_states.dart';
part 'login_bloc_events.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const InitialLoginState._()) {
    on<LoginFuncEvent>(_login);
  }

  void _login(
    LoginFuncEvent event,
    Emitter<LoginState> emitter,
  ) {
    emitter(const GDALoginState._());
  }

  void login(String username, String password) {
    add(LoginFuncEvent._(username, password));
  }
}
