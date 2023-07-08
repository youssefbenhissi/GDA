import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/login_bloc/login_widget.dart';
import 'package:provider/provider.dart';

class LoginScreenRouteBuilder {
  LoginScreenRouteBuilder();

  Widget call(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginBloc(),
        ),
      ],
      child:  LoginScreen(),
    );
  }
}
