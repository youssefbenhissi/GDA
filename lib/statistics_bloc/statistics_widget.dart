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
                return const StatisticsCard(
                  date: "date",
                  tauxDePerteTitre: "tauxDePerteTitre",
                  tauxDePerteValeur: 5.2,
                  consommationSpecifiqueTitre: "consommationSpecifiqueTitre",
                  consommationSpecifiqueValeur: 6.8,
                  consommationSpecifiqueEauDeJavelTitre:
                      "consommationSpecifiqueEauDeJavelTitre",
                  consommationSpecifiqueEauDeJavelValeur: 0.02,
                  recetteMoyenneTitre: "recetteMoyenneTitre",
                  recetteMoyenneValeur: 4,
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
