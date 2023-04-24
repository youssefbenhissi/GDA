import 'package:flutter/material.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/indicateur_bloc/statistic_widget.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IndicateurPage extends StatelessWidget {
  const IndicateurPage({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.currentLoginBloc.state;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryblue,
      drawer: const ApplicationDrawer(),
      appBar: AppBar(
          title: Text(
        state is GDALoginState
            ? AppLocalizations.of(context)!.indicateursTitre
            : AppLocalizations.of(context)!.indicateursGenerauxTitre,
      )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const ColoredBox(
              color: Colors.white,
              child: ConsultationStatisticsCard(
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
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              state is GDALoginState
                  ? "assets/images/indicateurs.png"
                  : "assets/images/goutte.png",
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
                    context.gNavigationService.openConsultationScreen(context);
                  },
                  child: Text(AppLocalizations.of(context)!.consulterTitre),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
