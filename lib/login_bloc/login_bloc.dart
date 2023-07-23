import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/login_bloc/login.model.dart';
import 'package:pfe_iheb/utils/constants.dart';
// ignore: import_of_legacy_library_into_null_safe
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
    String url = '$link/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"login": "${event.username}","password": "${event.password}"}';
    http.Response response = await http.post(url, headers: headers, body: json);
    if (response.statusCode == 200) {
      User u = User.fromJson(jsonDecode(response.body));
      emitter(GDALoginState._(u));
    } else if (response.statusCode == 201) {
      User u = User.fromJson(jsonDecode(response.body));

      emitter(DecideurCentralLoginState._(u));
    } else if (response.statusCode == 202) {
      User u = User.fromJson(jsonDecode(response.body));

      emitter(DecideurGouvernoratLoginState._(u));
    } else {
      emitter(const FailedLoginState._());
    }
  }

  void login(String username, String password) {
    add(LoginFuncEvent._(username, password));
  }
}
