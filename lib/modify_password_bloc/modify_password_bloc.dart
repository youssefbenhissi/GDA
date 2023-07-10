import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/utils/constants.dart';
import 'package:http/http.dart' as http;

part 'modify_password_events.dart';
part 'modify_password_states.dart';

class ModifyPasswordBloc
    extends Bloc<ModifyPasswordEvent, ModifyPasswordState> {
  ModifyPasswordBloc() : super(const InitialModifyPasswordState._()) {
    on<ModifyPasswordFuncEvent>(_modifyPassword);
  }

  Future<void> _modifyPassword(
    ModifyPasswordFuncEvent event,
    Emitter<ModifyPasswordState> emitter,
  ) async {
    String url = '$link/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"login": "${event.username}","password": "${event.password}"}';
    http.Response response = await http.post(url, headers: headers, body: json);
    if (response.statusCode == 400) {
      emitter(const FailedModifyPasswordState._());
    } else if (response.statusCode == 200) {
      emitter(const SuccededModifyPasswordState._());
    }
  }

  void modifyPassword({required String username, required String password}) {
    add(ModifyPasswordFuncEvent._(username, password));
  }
}
