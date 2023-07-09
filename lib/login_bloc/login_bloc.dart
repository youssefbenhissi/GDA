import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/utils/constants.dart';
import 'package:http/http.dart' as http;
part 'login_bloc_states.dart';
part 'login_bloc_events.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const InitialLoginState._()) {
    on<LoginFuncEvent>(_login);
  }

  Future<void> _login(
    LoginFuncEvent event,
    Emitter<LoginState> emitter,
  ) async {
    String url = link + '/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"login": "${event.username}","password": "${event.password}"}';
    http.Response response = await http.post(url, headers: headers, body: json);
    if (response.statusCode == 200) {
      emitter(const GDALoginState._());
    } else if (response.statusCode == 201) {
      emitter(const DecideurCentralLoginState._());
    } else if (response.statusCode == 202) {
      emitter(const DecideurGouvernoratLoginState._());
    } else {
      emitter(const FailedLoginState._());
    }
  }

  void login(String username, String password) {
    add(LoginFuncEvent._(username, password));
  }
}
