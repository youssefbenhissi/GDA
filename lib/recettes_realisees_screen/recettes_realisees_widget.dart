import 'package:flutter/material.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
part 'field_widget.dart';

class RecettesRealiseePage extends StatelessWidget {
  const RecettesRealiseePage({super.key});

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
      drawer: const ApplicationDrawer(),
      appBar: AppBar(
          title: Text(
        AppLocalizations.of(context)!.recettesRealiseesTitre,
      )),
      body: Column(
        children: [
          ColoredBox(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
              child: Column(
                children: [
                  WidgetField(
                    titre: "Recettes Vente Eau (DT)",
                    textEditingController: recetteVenteTextEditingController,
                  ),
                  WidgetField(
                    titre: "Recettes Adhésion (DT)",
                    textEditingController: recetteAdhesionTextEditingController,
                  ),
                  WidgetField(
                    titre: "Recettes Abonnement (DT)",
                    textEditingController:
                        recetteAbonnementTextEditingController,
                  ),
                  WidgetField(
                    titre: "Recettes Cotisations (DT)",
                    textEditingController:
                        recetteCotisationTextEditingController,
                  ),
                  WidgetField(
                    titre: "Autres Recettes (DT)",
                    textEditingController: autresRecettesTextEditingController,
                  ),
                  WidgetField(
                    titre: "Total",
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
                        onPressed: () {},
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
