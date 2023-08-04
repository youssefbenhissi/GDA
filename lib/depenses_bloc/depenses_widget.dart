import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/utils/field_widget.dart';

class DepensesPage extends StatelessWidget {
  final int month;
  final int year;
  const DepensesPage({super.key, required this.month, required this.year});

  @override
  Widget build(BuildContext context) {
    final TextEditingController depensesAchatEauTextEditingController =
        TextEditingController();
    final TextEditingController depensesEnergieTextEditingController =
        TextEditingController();
    final TextEditingController depensesSalairesEtPrimesTextEditingController =
        TextEditingController();
    final TextEditingController
        depensesMaintenaceEtEntretienTextEditingController =
        TextEditingController();
    final TextEditingController depensesLocationTextEditingController =
        TextEditingController();
    final TextEditingController
        depensesRenouvellementDesEquipementTextEditingController =
        TextEditingController();
    final TextEditingController depensesGestionDGATextEditingController =
        TextEditingController();
    final TextEditingController depensesDInvestissementTextEditingController =
        TextEditingController();
    final TextEditingController depensesAutresDepensesTextEditingController =
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
                context.gNavigationService
                    .openRecettesRealiseesScreen(context, month, year);
              },
              child: SvgPicture.asset(
                fit: BoxFit.contain,
                width: 25,
                color: Colors.white,
                "assets/images/arrow-left-solid.svg",
              ),
            ),
            Text(
              AppLocalizations.of(context)!.depensesRealiseesTitre,
            ),
            const SizedBox()
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
            child: Column(
              children: [
                WidgetField(
                  obscure: false,
                  enabled: true,
                  titre: AppLocalizations.of(context)!.depensesAchatEauTitre,
                  textEditingController: depensesAchatEauTextEditingController,
                ),
                WidgetField(
                  obscure: false,
                  enabled: true,
                  titre: AppLocalizations.of(context)!.depensesEnergieTitre,
                  textEditingController: depensesEnergieTextEditingController,
                ),
                WidgetField(
                  obscure: false,
                  enabled: true,
                  titre: AppLocalizations.of(context)!
                      .depensesSalairesEtPrimesTitre,
                  textEditingController:
                      depensesSalairesEtPrimesTextEditingController,
                ),
                WidgetField(
                  obscure: false,
                  enabled: true,
                  titre: AppLocalizations.of(context)!
                      .depensesMaintenanceEtEntretienTitre,
                  textEditingController:
                      depensesMaintenaceEtEntretienTextEditingController,
                ),
                WidgetField(
                  obscure: false,
                  enabled: true,
                  titre: AppLocalizations.of(context)!
                      .depensesLocationEtAutresChargesdExploitationTitre,
                  textEditingController: depensesLocationTextEditingController,
                ),
                WidgetField(
                  obscure: false,
                  enabled: true,
                  titre: AppLocalizations.of(context)!
                      .depensesRenouvellementDesEquipementsTitre,
                  textEditingController:
                      depensesRenouvellementDesEquipementTextEditingController,
                ),
                WidgetField(
                  obscure: false,
                  enabled: true,
                  titre: AppLocalizations.of(context)!.depensesGestionGDATitre,
                  textEditingController:
                      depensesGestionDGATextEditingController,
                ),
                WidgetField(
                  obscure: false,
                  enabled: true,
                  titre: AppLocalizations.of(context)!
                      .depensesdInvestissementTitre,
                  textEditingController:
                      depensesDInvestissementTextEditingController,
                ),
                WidgetField(
                  obscure: false,
                  enabled: true,
                  titre: AppLocalizations.of(context)!.autresDepensesTitre,
                  textEditingController:
                      depensesAutresDepensesTextEditingController,
                ),
                ColoredBox(
                  color: Colors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, left: 8.0),
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.green),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              onPressed: () {
                                var state = context.currentLoginBloc.state;
                                if (state is GDALoginState) {
                                  context.currentDepensesBloc
                                      .insertDonneesTechniques(
                                    createdBy: state.model.login,
                                    inputValueDepensesAchatEau:
                                        depensesAchatEauTextEditingController
                                            .text,
                                    idIndicateurDepensesAchatEau: 26,
                                    inputValueDepensesEnergie:
                                        depensesEnergieTextEditingController
                                            .text,
                                    idIndicateurDepensesEnergie: 27,
                                    inputValueDepensesSalairesPrimes:
                                        depensesSalairesEtPrimesTextEditingController
                                            .text,
                                    idIndicateurDepensesSalairesPrimes: 28,
                                    inputValueDepensesMaintenanceEntretien:
                                        depensesMaintenaceEtEntretienTextEditingController
                                            .text,
                                    idIndicateurDepensesMaintenanceEntretien:
                                        29,
                                    inputValueDepensesLocation:
                                        depensesLocationTextEditingController
                                            .text,
                                    idIndicateurDepensesLocation: 30,
                                    inputValueDepensesRenouvellement:
                                        depensesRenouvellementDesEquipementTextEditingController
                                            .text,
                                    idIndicateurDepensesRenouvellement: 32,
                                    inputValueDepensesGestionGDA:
                                        depensesGestionDGATextEditingController
                                            .text,
                                    idIndicateurDepensesGestionGDA: 33,
                                    inputValueDepensesInvestissement:
                                        depensesDInvestissementTextEditingController
                                            .text,
                                    idIndicateurDepensesInvestissement: 34,
                                    inputValueAutresDepenses:
                                        depensesAutresDepensesTextEditingController
                                            .text,
                                    idIndicateurAutresDepenses: 35,
                                    idSaisie: 19,
                                    month: month,
                                    year: year,
                                  );
                                } else if (state is DecideurCentralLoginState) {
                                  context.currentDepensesBloc
                                      .insertDonneesTechniques(
                                    createdBy: state.model.login,
                                    inputValueDepensesAchatEau:
                                        depensesAchatEauTextEditingController
                                            .text,
                                    idIndicateurDepensesAchatEau: 26,
                                    inputValueDepensesEnergie:
                                        depensesEnergieTextEditingController
                                            .text,
                                    idIndicateurDepensesEnergie: 27,
                                    inputValueDepensesSalairesPrimes:
                                        depensesSalairesEtPrimesTextEditingController
                                            .text,
                                    idIndicateurDepensesSalairesPrimes: 28,
                                    inputValueDepensesMaintenanceEntretien:
                                        depensesMaintenaceEtEntretienTextEditingController
                                            .text,
                                    idIndicateurDepensesMaintenanceEntretien:
                                        29,
                                    inputValueDepensesLocation:
                                        depensesLocationTextEditingController
                                            .text,
                                    idIndicateurDepensesLocation: 30,
                                    inputValueDepensesRenouvellement:
                                        depensesRenouvellementDesEquipementTextEditingController
                                            .text,
                                    idIndicateurDepensesRenouvellement: 32,
                                    inputValueDepensesGestionGDA:
                                        depensesGestionDGATextEditingController
                                            .text,
                                    idIndicateurDepensesGestionGDA: 33,
                                    inputValueDepensesInvestissement:
                                        depensesDInvestissementTextEditingController
                                            .text,
                                    idIndicateurDepensesInvestissement: 34,
                                    inputValueAutresDepenses:
                                        depensesAutresDepensesTextEditingController
                                            .text,
                                    idIndicateurAutresDepenses: 35,
                                    idSaisie: 19,
                                    month: month,
                                    year: year,
                                  );
                                } else if (state
                                    is DecideurGouvernoratLoginState) {
                                  context.currentDepensesBloc
                                      .insertDonneesTechniques(
                                    createdBy: state.model.login,
                                    inputValueDepensesAchatEau:
                                        depensesAchatEauTextEditingController
                                            .text,
                                    idIndicateurDepensesAchatEau: 26,
                                    inputValueDepensesEnergie:
                                        depensesEnergieTextEditingController
                                            .text,
                                    idIndicateurDepensesEnergie: 27,
                                    inputValueDepensesSalairesPrimes:
                                        depensesSalairesEtPrimesTextEditingController
                                            .text,
                                    idIndicateurDepensesSalairesPrimes: 28,
                                    inputValueDepensesMaintenanceEntretien:
                                        depensesMaintenaceEtEntretienTextEditingController
                                            .text,
                                    idIndicateurDepensesMaintenanceEntretien:
                                        29,
                                    inputValueDepensesLocation:
                                        depensesLocationTextEditingController
                                            .text,
                                    idIndicateurDepensesLocation: 30,
                                    inputValueDepensesRenouvellement:
                                        depensesRenouvellementDesEquipementTextEditingController
                                            .text,
                                    idIndicateurDepensesRenouvellement: 32,
                                    inputValueDepensesGestionGDA:
                                        depensesGestionDGATextEditingController
                                            .text,
                                    idIndicateurDepensesGestionGDA: 33,
                                    inputValueDepensesInvestissement:
                                        depensesDInvestissementTextEditingController
                                            .text,
                                    idIndicateurDepensesInvestissement: 34,
                                    inputValueAutresDepenses:
                                        depensesAutresDepensesTextEditingController
                                            .text,
                                    idIndicateurAutresDepenses: 35,
                                    idSaisie: 19,
                                    month: month,
                                    year: year,
                                  );
                                }
                                context.gNavigationService
                                    .openFicheGDAScreen(context);
                              },
                              child: Text(
                                  AppLocalizations.of(context)!.envoyerTitre),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
