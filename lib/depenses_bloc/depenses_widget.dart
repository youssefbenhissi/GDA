import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/utils/field_widget.dart';

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
