// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/indicateur_bloc/statistic_widget.dart';
import 'package:pfe_iheb/specific_indicateur_bloc/specific_indicateur_bloc.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SpecificIndicateurPage extends StatelessWidget {
  final int month;
  final int year;
  const SpecificIndicateurPage(
      {super.key, required this.month, required this.year});

  @override
  Widget build(BuildContext context) {
    var state = context.currentLoginBloc.state;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryblue,
      drawer: const ApplicationDrawer(),
      appBar: AppBar(
          title:
              Text('Indificateur ' + year.toString() + "-" + month.toString())),
      body: SingleChildScrollView(
        child: BlocBuilder<SpecificIndicateurBloc, SpecificIndicateurState>(
          buildWhen: (prev, next) => prev.runtimeType != next.runtimeType,
          builder: (context, state) {
            if (state is LoadedSpecificIndicateurState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ColoredBox(
                    color: Colors.white,
                    child: ConsultationStatisticsCard(
                      tauxDePerteTitre:
                          AppLocalizations.of(context)!.tauxDePerteTitre,
                      tauxDeRecouvrementTitre:
                          AppLocalizations.of(context)!.tauxDeRecouvrementTitre,
                      tauxDeRecouvrementValeur:
                          double.tryParse(state.models[1].inputValue)!
                              .toStringAsFixed(2),
                      tauxDePerteValeur:
                          double.tryParse(state.models[0].inputValue)!
                              .toStringAsFixed(2),
                      consommationSpecifiqueTitre: AppLocalizations.of(context)!
                          .consommationSpecifiqueTitre,
                      consommationSpecifiqueValeur:
                          double.tryParse(state.models[2].inputValue)!
                              .toStringAsFixed(2),
                      consommationSpecifiqueEauDeJavelTitre:
                          AppLocalizations.of(context)!
                              .consommationSpecifiqueEauDeJavelTitre,
                      consommationSpecifiqueEauDeJavelValeur:
                          double.tryParse(state.models[3].inputValue)!
                              .toStringAsFixed(2),
                      recetteMoyenneTitre:
                          AppLocalizations.of(context)!.recetteMoyenneTitre,
                      recetteMoyenneValeur:
                          double.tryParse(state.models[4].inputValue)!
                              .toStringAsFixed(2),
                      nombreDeJourArretTitre:
                          AppLocalizations.of(context)!.nombreDeJourArretTitre,
                      nombreDeJourArretValeur:
                          double.tryParse(state.models[5].inputValue)!
                              .toStringAsFixed(2),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/goutte.png",
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {
                          context.gNavigationService
                              .openConsultationScreen(context);
                        },
                        child:
                            Text(AppLocalizations.of(context)!.consulterTitre),
                      ),
                    ),
                  )
                ],
              );
            }
            return const Center(child: CupertinoActivityIndicator());
          },
        ),
      ),
    );
  }
}
