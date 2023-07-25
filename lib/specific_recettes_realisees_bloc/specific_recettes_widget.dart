import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/specific_recettes_realisees_bloc/specific_recettes_realisees_bloc.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/utils/field_widget.dart';

class SpecificRecettesRealiseePage extends StatefulWidget {
  final String gda;
  final int month;
  final int year;
  const SpecificRecettesRealiseePage(
      {super.key, required this.gda, required this.month, required this.year});

  @override
  State<SpecificRecettesRealiseePage> createState() =>
      _SpecificRecettesRealiseePageState();
}

class _SpecificRecettesRealiseePageState
    extends State<SpecificRecettesRealiseePage> {
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
  final TextEditingController totalRecettesTextEditingContorller =
      TextEditingController();
  @override
  void dispose() {
    recetteVenteTextEditingController.dispose();
    recetteAdhesionTextEditingController.dispose();
    recetteAbonnementTextEditingController.dispose();
    recetteCotisationTextEditingController.dispose();
    autresRecettesTextEditingController.dispose();
    totalRecettesTextEditingContorller.dispose();
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
                context.gNavigationService.openDepensesRealiseesScreen(context);
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
      body: BlocBuilder<SpecificRecettesRealiseesBloc,
          SpecificRecettesRealiseesState>(
        buildWhen: (prev, next) => prev.runtimeType != next.runtimeType,
        builder: (context, state) {
          if (state is LoadedSpecificRecettesRealiseesState) {
            recetteVenteTextEditingController.text = state.models[0].inputValue;
            recetteAdhesionTextEditingController.text =
                state.models[1].inputValue;
            recetteCotisationTextEditingController.text =
                state.models[2].inputValue;
            autresRecettesTextEditingController.text =
                state.models[3].inputValue;
            final double recetteVente =
                double.tryParse(recetteVenteTextEditingController.text) ?? 0.0;
            final double recetteAdhesion =
                double.tryParse(recetteAdhesionTextEditingController.text) ??
                    0.0;
            final double recetteCotisation =
                double.tryParse(recetteAdhesionTextEditingController.text) ??
                    0.0;
            final double autresRecettes =
                double.tryParse(autresRecettesTextEditingController.text) ??
                    0.0;
            final double total = recetteVente +
                recetteAdhesion +
                recetteCotisation +
                autresRecettes;
            autresRecettesTextEditingController.text = total.toString();
            return Column(
              children: [
                ColoredBox(
                  color: Colors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                    child: Column(
                      children: [
                        WidgetField(
                          obscure: false,
                          enabled: true,
                          titre: AppLocalizations.of(context)!
                              .recettesVenteEauTitre,
                          textEditingController:
                              recetteVenteTextEditingController,
                        ),
                        WidgetField(
                          obscure: false,
                          enabled: false,
                          titre: AppLocalizations.of(context)!
                              .recettesAdhesionTitre,
                          textEditingController:
                              recetteAdhesionTextEditingController,
                        ),
                        WidgetField(
                          obscure: false,
                          enabled: false,
                          titre: AppLocalizations.of(context)!
                              .recettesAbonnementTitre,
                          textEditingController:
                              recetteAbonnementTextEditingController,
                        ),
                        WidgetField(
                          obscure: false,
                          enabled: false,
                          titre: AppLocalizations.of(context)!
                              .recettesCotisationsTitre,
                          textEditingController:
                              recetteCotisationTextEditingController,
                        ),
                        WidgetField(
                          obscure: false,
                          enabled: false,
                          titre:
                              AppLocalizations.of(context)!.autresRecettesTitre,
                          textEditingController:
                              autresRecettesTextEditingController,
                        ),
                        WidgetField(
                          obscure: false,
                          enabled: false,
                          titre: AppLocalizations.of(context)!.totalTitre,
                          textEditingController:
                              recetteAdhesionTextEditingController,
                        ),
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
                                context.gNavigationService
                                    .openDepensesRealiseesScreen(context);
                              },
                              child: Text(
                                  AppLocalizations.of(context)!.depenseTitre),
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
        },
      ),
    );
  }
}
