import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/modify_password_bloc/modify_password_bloc.dart';
import 'package:pfe_iheb/modify_password_bloc/modify_password_widget.dart';

class ModifyPasswordScreenRouteBuilder {
  ModifyPasswordScreenRouteBuilder();

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ModifyPasswordBloc(),
        ),
      ],
      child: const ModifyPasswordScreen(),
    );
  }
}
