import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/consultation_bloc/consultation_bloc.dart';
import 'package:pfe_iheb/consultation_bloc/consultation_widget.dart';
import 'package:provider/provider.dart';

class ConsultationScreenRouteBuilder {
  ConsultationScreenRouteBuilder();

  Widget call(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => ConsultationBloc(),
        ),
      ],
      child: const ConsultationPage(),
    );
  }
}
