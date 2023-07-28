import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/specific_depenses_bloc/specific_depenses_bloc.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/utils/field_widget.dart';

class SpecificDepensesPage extends StatefulWidget {
  final String gda;
  final int month;
  final int year;
  const SpecificDepensesPage(
      {super.key, required this.gda, required this.month, required this.year});

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
    depensesTotalTextEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
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
                Navigator.pop(context);
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
            child: BlocBuilder<SpecificDepensesBloc, SpecificDepensesState>(
                buildWhen: (prev, next) => prev.runtimeType != next.runtimeType,
                builder: (context, state) {
                  if (state is LoadedSpecificDepensesState) {
                    depensesAchatEauTextEditingController.text =
                        state.models[0].inputValue;
                    depensesEnergieTextEditingController.text =
                        state.models[1].inputValue;
                    depensesSalairesEtPrimesTextEditingController.text =
                        state.models[2].inputValue;
                    depensesMaintenaceEtEntretienTextEditingController.text =
                        state.models[3].inputValue;
                    depensesLocationTextEditingController.text =
                        state.models[4].inputValue;
                    depensesRenouvellementDesEquipementTextEditingController
                        .text = state.models[5].inputValue;
                    depensesGestionDGATextEditingController.text =
                        state.models[6].inputValue;
                    depensesDInvestissementTextEditingController.text =
                        state.models[7].inputValue;
                    depensesAutresDepensesTextEditingController.text =
                        state.models[8].inputValue;
                    final double depensesAchatEau = double.tryParse(
                            depensesAchatEauTextEditingController.text) ??
                        0.0;
                    final double depensesEnergie = double.tryParse(
                            depensesEnergieTextEditingController.text) ??
                        0.0;
                    final double depensesSalairesEtPrimes = double.tryParse(
                            depensesSalairesEtPrimesTextEditingController
                                .text) ??
                        0.0;
                    final double depensesMaintenaceEtEntretien = double.tryParse(
                            depensesMaintenaceEtEntretienTextEditingController
                                .text) ??
                        0.0;
                    final double depensesLocation = double.tryParse(
                            depensesLocationTextEditingController.text) ??
                        0.0;
                    final double depensesRenouvellementDesEquipement =
                        double.tryParse(
                                depensesRenouvellementDesEquipementTextEditingController
                                    .text) ??
                            0.0;
                    final double depensesGestionDGA = double.tryParse(
                            depensesGestionDGATextEditingController.text) ??
                        0.0;
                    final double depensesDInvestissement = double.tryParse(
                            depensesDInvestissementTextEditingController
                                .text) ??
                        0.0;
                    final double depensesAutresDepenses = double.tryParse(
                            depensesAutresDepensesTextEditingController.text) ??
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
                    return Column(
                      children: [
                        WidgetField(
                          obscure: false,
                          enabled: false,
                          titre: AppLocalizations.of(context)!
                              .depensesAchatEauTitre,
                          textEditingController:
                              depensesAchatEauTextEditingController,
                        ),
                        WidgetField(
                          obscure: false,
                          enabled: false,
                          titre: AppLocalizations.of(context)!
                              .depensesEnergieTitre,
                          textEditingController:
                              depensesEnergieTextEditingController,
                        ),
                        WidgetField(
                          obscure: false,
                          enabled: false,
                          titre: AppLocalizations.of(context)!
                              .depensesSalairesEtPrimesTitre,
                          textEditingController:
                              depensesSalairesEtPrimesTextEditingController,
                        ),
                        WidgetField(
                          obscure: false,
                          enabled: false,
                          titre: AppLocalizations.of(context)!
                              .depensesMaintenanceEtEntretienTitre,
                          textEditingController:
                              depensesMaintenaceEtEntretienTextEditingController,
                        ),
                        WidgetField(
                          obscure: false,
                          enabled: false,
                          titre: AppLocalizations.of(context)!
                              .depensesLocationEtAutresChargesdExploitationTitre,
                          textEditingController:
                              depensesLocationTextEditingController,
                        ),
                        WidgetField(
                          obscure: false,
                          enabled: false,
                          titre: AppLocalizations.of(context)!
                              .depensesRenouvellementDesEquipementsTitre,
                          textEditingController:
                              depensesRenouvellementDesEquipementTextEditingController,
                        ),
                        WidgetField(
                          obscure: false,
                          enabled: false,
                          titre: AppLocalizations.of(context)!
                              .depensesGestionGDATitre,
                          textEditingController:
                              depensesGestionDGATextEditingController,
                        ),
                        WidgetField(
                          obscure: false,
                          enabled: false,
                          titre: AppLocalizations.of(context)!
                              .depensesdInvestissementTitre,
                          textEditingController:
                              depensesDInvestissementTextEditingController,
                        ),
                        WidgetField(
                          obscure: false,
                          enabled: false,
                          titre:
                              AppLocalizations.of(context)!.autresDepensesTitre,
                          textEditingController:
                              depensesAutresDepensesTextEditingController,
                        ),
                        WidgetField(
                          obscure: false,
                          enabled: false,
                          titre: AppLocalizations.of(context)!.totalTitre,
                          textEditingController:
                              depensesTotalTextEditingController,
                        ),
                        ColoredBox(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, right: 8.0, left: 8.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 8.0),
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
                                        context.gNavigationService
                                            .openSpecificFicheGDAScreen(
                                                context,
                                                widget.month,
                                                widget.year,
                                                widget.gda);
                                      },
                                      child: Text(AppLocalizations.of(context)!
                                          .envoyerTitre),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
