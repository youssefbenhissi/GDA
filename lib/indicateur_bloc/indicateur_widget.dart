import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/indicateur_bloc/indicateur_bloc.dart';
import 'package:pfe_iheb/indicateur_bloc/statistic_widget.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IndicateurPage extends StatelessWidget {
  const IndicateurPage({super.key});

  @override
  Widget build(BuildContext context) {
    var stateLogin = context.currentLoginBloc.state;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.primaryblue,
        drawer: const ApplicationDrawer(),
        appBar: AppBar(
            title: Text(
          stateLogin is GDALoginState
              ? AppLocalizations.of(context)!.indicateursTitre
              : AppLocalizations.of(context)!.indicateursGenerauxTitre,
        )),
        body: SingleChildScrollView(
          child: BlocBuilder<IndicateurBloc, IndicateurState>(
              buildWhen: (prev, next) => prev.runtimeType != next.runtimeType,
              builder: (context, state) {
                if (state is LoadedIndicateurState) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ColoredBox(
                        color: Colors.white,
                        child: ConsultationStatisticsCard(
                          tauxDePerteTitre:
                              AppLocalizations.of(context)!.tauxDePerteTitre,
                          tauxDeRecouvrementTitre: AppLocalizations.of(context)!
                              .tauxDeRecouvrementTitre,
                          tauxDeRecouvrementValeur:
                              double.tryParse(state.models[1].inputValue) ??
                                  0.0,
                          tauxDePerteValeur:
                              double.tryParse(state.models[0].inputValue) ??
                                  0.0,
                          consommationSpecifiqueTitre:
                              AppLocalizations.of(context)!
                                  .consommationSpecifiqueTitre,
                          consommationSpecifiqueValeur:
                              double.tryParse(state.models[2].inputValue) ??
                                  0.0,
                          consommationSpecifiqueEauDeJavelTitre:
                              AppLocalizations.of(context)!
                                  .consommationSpecifiqueEauDeJavelTitre,
                          consommationSpecifiqueEauDeJavelValeur:
                              double.tryParse(state.models[3].inputValue) ??
                                  0.0,
                          recetteMoyenneTitre:
                              AppLocalizations.of(context)!.recetteMoyenneTitre,
                          recetteMoyenneValeur:
                              double.tryParse(state.models[4].inputValue) ??
                                  0.0,
                          nombreDeJourArretTitre: AppLocalizations.of(context)!
                              .nombreDeJourArretTitre,
                          nombreDeJourArretValeur:
                              double.tryParse(state.models[5].inputValue) ??
                                  0.0,
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
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () {
                              context.gNavigationService
                                  .openConsultationScreen(context);
                            },
                            child: Text(
                                AppLocalizations.of(context)!.consulterTitre),
                          ),
                        ),
                      )
                    ],
                  );
                }
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }),
        ));
  }
}
