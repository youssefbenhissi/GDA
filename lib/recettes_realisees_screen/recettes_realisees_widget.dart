import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/utils/field_widget.dart';

class RecettesRealiseePage extends StatelessWidget {
  final int month;
  final int year;
  const RecettesRealiseePage(
      {super.key, required this.month, required this.year});

  @override
  Widget build(BuildContext context) {
    final TextEditingController recetteVenteTextEditingController =
        TextEditingController();
    final TextEditingController recetteAdhesionTextEditingController =
        TextEditingController();
    final TextEditingController recetteAbonnementTextEditingController =
        TextEditingController();
    final TextEditingController recetteCotisationTextEditingController =
        TextEditingController();
    final TextEditingController autresRecettesTextEditingController =
        TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryblue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.gNavigationService.openDonneesTechniquesScreen(context);
              },
              child: SvgPicture.asset(
                fit: BoxFit.contain,
                width: 25,
                color: Colors.white,
                "assets/images/arrow-left-solid.svg",
              ),
            ),
            Text(
              AppLocalizations.of(context)!.recettesRealiseesTitre,
            ),
            GestureDetector(
              onTap: () {
                context.gNavigationService
                    .openDepensesRealiseesScreen(context, month, year);
              },
              child: SvgPicture.asset(
                fit: BoxFit.contain,
                width: 25,
                color: Colors.white,
                "assets/images/arrow-right-solid.svg",
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          ColoredBox(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
              child: Column(
                children: [
                  WidgetField(
                    obscure: false,
                    enabled: true,
                    titre: AppLocalizations.of(context)!.recettesVenteEauTitre,
                    textEditingController: recetteVenteTextEditingController,
                  ),
                  WidgetField(
                    obscure: false,
                    enabled: true,
                    titre: AppLocalizations.of(context)!.recettesAdhesionTitre,
                    textEditingController: recetteAdhesionTextEditingController,
                  ),
                  WidgetField(
                    obscure: false,
                    enabled: true,
                    titre:
                        AppLocalizations.of(context)!.recettesAbonnementTitre,
                    textEditingController:
                        recetteAbonnementTextEditingController,
                  ),
                  WidgetField(
                    obscure: false,
                    enabled: true,
                    titre:
                        AppLocalizations.of(context)!.recettesCotisationsTitre,
                    textEditingController:
                        recetteCotisationTextEditingController,
                  ),
                  WidgetField(
                    obscure: false,
                    enabled: true,
                    titre: AppLocalizations.of(context)!.autresRecettesTitre,
                    textEditingController: autresRecettesTextEditingController,
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
                          var state = context.currentLoginBloc.state;

                          if (state is GDALoginState) {
                            context.currentRecettesRealiseesBloc
                                .insertRecettesRealisees(
                              createdBy: state.model.login,
                              inputValueRecettesVenteEau:
                                  recetteVenteTextEditingController.text,
                              idIndicateurRecettesVenteEau: 21,
                              inputValueRecettesAdhesion:
                                  recetteAdhesionTextEditingController.text,
                              idIndicateurRecettesAdhesion: 24,
                              inputValueRecettesAbonnement:
                                  recetteAbonnementTextEditingController.text,
                              idIndicateurRecettesAbonnement: 23,
                              inputValueRecettesCotisations:
                                  recetteCotisationTextEditingController.text,
                              idIndicateurRecettesCotisations: 22,
                              inputValueAutresRecettes:
                                  autresRecettesTextEditingController.text,
                              idIndicateurAutresRecettes: 25,
                              idSaisie: 19,
                              month: month,
                              year: year,
                            );
                          } else if (state is DecideurCentralLoginState) {
                            context.currentRecettesRealiseesBloc
                                .insertRecettesRealisees(
                              createdBy: state.model.login,
                              inputValueRecettesVenteEau:
                                  recetteVenteTextEditingController.text,
                              idIndicateurRecettesVenteEau: 21,
                              inputValueRecettesAdhesion:
                                  recetteAdhesionTextEditingController.text,
                              idIndicateurRecettesAdhesion: 24,
                              inputValueRecettesAbonnement:
                                  recetteAbonnementTextEditingController.text,
                              idIndicateurRecettesAbonnement: 23,
                              inputValueRecettesCotisations:
                                  recetteCotisationTextEditingController.text,
                              idIndicateurRecettesCotisations: 22,
                              inputValueAutresRecettes:
                                  autresRecettesTextEditingController.text,
                              idIndicateurAutresRecettes: 25,
                              idSaisie: 19,
                              month: month,
                              year: year,
                            );
                          } else if (state is DecideurGouvernoratLoginState) {
                            context.currentRecettesRealiseesBloc
                                .insertRecettesRealisees(
                              createdBy: state.model.login,
                              inputValueRecettesVenteEau:
                                  recetteVenteTextEditingController.text,
                              idIndicateurRecettesVenteEau: 21,
                              inputValueRecettesAdhesion:
                                  recetteAdhesionTextEditingController.text,
                              idIndicateurRecettesAdhesion: 24,
                              inputValueRecettesAbonnement:
                                  recetteAbonnementTextEditingController.text,
                              idIndicateurRecettesAbonnement: 23,
                              inputValueRecettesCotisations:
                                  recetteCotisationTextEditingController.text,
                              idIndicateurRecettesCotisations: 22,
                              inputValueAutresRecettes:
                                  autresRecettesTextEditingController.text,
                              idIndicateurAutresRecettes: 25,
                              idSaisie: 19,
                              month: month,
                              year: year,
                            );
                          }
                          context.gNavigationService
                              .openDepensesRealiseesScreen(
                                  context, month, year);
                        },
                        child: Text(
                            AppLocalizations.of(context)!.saisirDepenseTitre),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
