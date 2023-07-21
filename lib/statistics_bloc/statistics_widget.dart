import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/statistics_bloc/statistic_card_widget.dart';
import 'package:pfe_iheb/statistics_bloc/statistics_bloc.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryblue,
      drawer: const ApplicationDrawer(),
      appBar: AppBar(
          title: Text(
        AppLocalizations.of(context)!.statistiquesTitre,
      )),
      body: BlocBuilder<StatisticsBloc, StatisticsState>(
        buildWhen: (prev, next) => prev.runtimeType != next.runtimeType,
        builder: (context, state) {
          if (state is LoadedStatiticsState) {
            return ListView.builder(
              itemCount: state.models.length,
              itemBuilder: (context, index) {
                return StatisticsCard(
                  date: state.models.keys.elementAt(index),
                  tauxDePerteTitre:
                      AppLocalizations.of(context)!.tauxDePerteTitre,
                  tauxDePerteValeur:
                      state.models[state.models.keys.elementAt(index)]![0],
                  consommationSpecifiqueTitre:
                      AppLocalizations.of(context)!.consommationSpecifiqueTitre,
                  consommationSpecifiqueValeur:
                      state.models[state.models.keys.elementAt(index)]![1],
                  consommationSpecifiqueEauDeJavelTitre:
                      AppLocalizations.of(context)!
                          .consommationSpecifiqueEauDeJavelTitre,
                  consommationSpecifiqueEauDeJavelValeur:
                      state.models[state.models.keys.elementAt(index)]![2],
                  recetteMoyenneTitre:
                      AppLocalizations.of(context)!.recetteMoyenneTitre,
                  recetteMoyenneValeur:
                      state.models[state.models.keys.elementAt(index)]![3],
                );
              },
            );
          }
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        },
      ),
    );
  }
}
