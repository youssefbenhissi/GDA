import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/login_bloc/login_widget.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_bloc.dart';

class LoginScreenRouteBuilder {
  LoginScreenRouteBuilder();

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginBloc(),
        ),
      ],
      child: const LoginScreen(),
    );
  }
}
