import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/consultation_screen_bloc/consultation_screen_bloc.dart';
import 'package:pfe_iheb/consultation_screen_bloc/consultation_screen_widget.dart';

class ConsultationScreenRouteBuilder {
  ConsultationScreenRouteBuilder();

  Widget call(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ConsultationScreenBloc(),
        ),
      ],
      child: const ConsultationPage(),
    );
  }
}
