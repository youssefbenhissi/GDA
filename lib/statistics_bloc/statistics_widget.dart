import 'package:flutter/material.dart';
import 'package:pfe_iheb/statistics_bloc/statistic_card_widget.dart';
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
      body: ListView.builder(
        itemCount: 15,
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
      ),
    );
  }
}
