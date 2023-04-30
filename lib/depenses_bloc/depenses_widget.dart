import 'package:flutter/material.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
part 'field_widget.dart';

class DepensesPage extends StatelessWidget {
  const DepensesPage({super.key});

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
    final TextEditingController depensesTotalTextEditingController =
        TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryblue,
      drawer: const ApplicationDrawer(),
      appBar: AppBar(
          title: Text(
        AppLocalizations.of(context)!.recettesRealiseesTitre,
      )),
      body: SingleChildScrollView(
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
            child: Column(
              children: [
                WidgetField(
                  enabled: true,
                  titre: "Dépenses Achat Eau (DT)",
                  textEditingController: depensesAchatEauTextEditingController,
                ),
                WidgetField(
                  enabled: true,
                  titre: "Dépenses Energie (DT)",
                  textEditingController: depensesEnergieTextEditingController,
                ),
                WidgetField(
                  enabled: true,
                  titre: "Dépenses Salaires et Primes (DT)",
                  textEditingController:
                      depensesSalairesEtPrimesTextEditingController,
                ),
                WidgetField(
                  enabled: true,
                  titre: "Dépenses Maintenance et Entretien (DT)",
                  textEditingController:
                      depensesMaintenaceEtEntretienTextEditingController,
                ),
                WidgetField(
                  enabled: true,
                  titre: "Dépenses Location et Autres Charges d'Exploitation",
                  textEditingController: depensesLocationTextEditingController,
                ),
                WidgetField(
                  enabled: true,
                  titre: "Dépenses Renouvellement des Equipements (DT)",
                  textEditingController:
                      depensesRenouvellementDesEquipementTextEditingController,
                ),
                WidgetField(
                  enabled: true,
                  titre: "Dépenses Gestion GDA (DT)",
                  textEditingController:
                      depensesGestionDGATextEditingController,
                ),
                WidgetField(
                  enabled: true,
                  titre: "Dépenses d'Investissement (DT)",
                  textEditingController:
                      depensesDInvestissementTextEditingController,
                ),
                WidgetField(
                  enabled: true,
                  titre: "Autres Dépenses (DT)",
                  textEditingController:
                      depensesAutresDepensesTextEditingController,
                ),
                WidgetField(
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
