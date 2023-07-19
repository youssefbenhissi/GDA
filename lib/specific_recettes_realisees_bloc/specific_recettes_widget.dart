import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/specific_fiche_gda_bloc/specific_fiche_gda_model.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/utils/field_widget.dart';

class SpecificRecettesRealiseePage extends StatelessWidget {
  final SpecificFicheGDAModel modele;
  const SpecificRecettesRealiseePage({super.key, required this.modele});

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
                    titre: "Recettes Vente Eau (DT)",
                    textEditingController: recetteVenteTextEditingController,
                  ),
                  WidgetField(
                    obscure: false,
                    enabled: true,
                    titre: "Recettes Adhésion (DT)",
                    textEditingController: recetteAdhesionTextEditingController,
                  ),
                  WidgetField(
                    obscure: false,
                    enabled: true,
                    titre: "Recettes Abonnement (DT)",
                    textEditingController:
                        recetteAbonnementTextEditingController,
                  ),
                  WidgetField(
                    obscure: false,
                    enabled: true,
                    titre: "Recettes Cotisations (DT)",
                    textEditingController:
                        recetteCotisationTextEditingController,
                  ),
                  WidgetField(
                    obscure: false,
                    enabled: true,
                    titre: "Autres Recettes (DT)",
                    textEditingController: autresRecettesTextEditingController,
                  ),
                  WidgetField(
                    obscure: false,
                    enabled: true,
                    titre: AppLocalizations.of(context)!.totalTitre,
                    textEditingController: recetteAdhesionTextEditingController,
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
                          context.gNavigationService
                              .openDepensesRealiseesScreen(context);
                        },
                        child: Text(AppLocalizations.of(context)!.depenseTitre),
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
