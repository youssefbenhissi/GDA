import 'package:flutter/material.dart';
import 'package:pfe_iheb/consultation_bloc/statistic_widget.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConsultationPage extends StatelessWidget {
  const ConsultationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryblue,
      drawer: const ApplicationDrawer(),
      appBar: AppBar(
          title: Text(
        AppLocalizations.of(context)!.indicateursTitre,
      )),
      body: SingleChildScrollView(
        child: ColoredBox(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              ConsultationStatisticsCard(
                tauxDePerteTitre: "tauxDePerteTitre",
                tauxDeRecouvrementTitre: "tauxDeRecouvrementTitre",
                tauxDeRecouvrementValeur: 80,
                tauxDePerteValeur: 5.2,
                consommationSpecifiqueTitre: "consommationSpecifiqueTitre",
                consommationSpecifiqueValeur: 6.8,
                consommationSpecifiqueEauDeJavelTitre:
                    "consommationSpecifiqueEauDeJavelTitre",
                consommationSpecifiqueEauDeJavelValeur: 0.02,
                recetteMoyenneTitre: "recetteMoyenneTitre",
                recetteMoyenneValeur: 4,
                nombreDeJourArretTitre: "nombreDeJourArretTitre",
                nombreDeJourArretValeur: 85,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
