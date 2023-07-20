import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/specific_fiche_gda_bloc/specific_fiche_gda_model.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/utils/field_widget.dart';

class SpecificDepensesPage extends StatefulWidget {
  final SpecificFicheGDAModel modele;
  const SpecificDepensesPage({super.key, required this.modele});

  @override
  State<SpecificDepensesPage> createState() => _SpecificDepensesPageState();
}

class _SpecificDepensesPageState extends State<SpecificDepensesPage> {
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

  final TextEditingController depensesTotalTextEditingController =
      TextEditingController();
  @override
  void dispose() {
    depensesAchatEauTextEditingController.dispose();
    depensesEnergieTextEditingController.dispose();
    depensesSalairesEtPrimesTextEditingController.dispose();
    depensesMaintenaceEtEntretienTextEditingController.dispose();
    depensesLocationTextEditingController.dispose();
    depensesRenouvellementDesEquipementTextEditingController.dispose();
    depensesGestionDGATextEditingController.dispose();
    depensesDInvestissementTextEditingController.dispose();
    depensesAutresDepensesTextEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    depensesAchatEauTextEditingController.text = widget.modele.depensesAchatEau;
    depensesEnergieTextEditingController.text = widget.modele.depensesEnergie;
    depensesSalairesEtPrimesTextEditingController.text =
        widget.modele.depensesSalairesEtPrimes;
    depensesMaintenaceEtEntretienTextEditingController.text =
        widget.modele.depensesMaintenaceEtEntretien;
    depensesLocationTextEditingController.text = widget.modele.depensesLocation;
    depensesRenouvellementDesEquipementTextEditingController.text =
        widget.modele.depensesRenouvellementDesEquipement;
    depensesGestionDGATextEditingController.text =
        widget.modele.depensesGestionDGA;
    depensesDInvestissementTextEditingController.text =
        widget.modele.depensesDInvestissement;
    final double depensesAchatEau =
        double.tryParse(depensesAchatEauTextEditingController.text) ?? 0.0;
    final double depensesEnergie =
        double.tryParse(depensesEnergieTextEditingController.text) ?? 0.0;
    final double depensesSalairesEtPrimes =
        double.tryParse(depensesSalairesEtPrimesTextEditingController.text) ??
            0.0;
    final double depensesMaintenaceEtEntretien = double.tryParse(
            depensesMaintenaceEtEntretienTextEditingController.text) ??
        0.0;
    final double depensesLocation =
        double.tryParse(depensesLocationTextEditingController.text) ?? 0.0;
    final double depensesRenouvellementDesEquipement = double.tryParse(
            depensesRenouvellementDesEquipementTextEditingController.text) ??
        0.0;
    final double depensesGestionDGA =
        double.tryParse(depensesGestionDGATextEditingController.text) ?? 0.0;
    final double depensesDInvestissement =
        double.tryParse(depensesDInvestissementTextEditingController.text) ??
            0.0;
    final double depensesAutresDepenses =
        double.tryParse(depensesAutresDepensesTextEditingController.text) ??
            0.0;
    final double total = depensesAchatEau +
        depensesEnergie +
        depensesSalairesEtPrimes +
        depensesMaintenaceEtEntretien +
        depensesLocation +
        depensesRenouvellementDesEquipement +
        depensesGestionDGA +
        depensesDInvestissement +
        depensesAutresDepenses;
    depensesTotalTextEditingController.text = total.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                context.gNavigationService.openRecettesRealiseesScreen(context);
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
                WidgetField(
                  obscure: false,
                  enabled: false,
                  titre: AppLocalizations.of(context)!.totalTitre,
                  textEditingController: depensesTotalTextEditingController,
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
                              onPressed: () {},
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
