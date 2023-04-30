import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:pfe_iheb/utils/field_widget.dart';

class SaisirDonneesTechniquesPage extends StatefulWidget {
  const SaisirDonneesTechniquesPage({super.key});

  @override
  State<SaisirDonneesTechniquesPage> createState() =>
      _SaisirDonneesTechniquesPageState();
}

class _SaisirDonneesTechniquesPageState
    extends State<SaisirDonneesTechniquesPage> {
  @override
  Widget build(BuildContext context) {
    const List<String> months = [
      'janvier',
      'février',
      'mars',
      'avril',
      'mai',
      'juin',
      'juillet',
      'août',
      'septembre',
      'octobre',
      'novembre',
      'décembre',
    ];
    const List<String> years = ['2019', '2020', '2021', '2022', '2023', '2024'];
    String month = "janvier";
    String year = "2019";
    final TextEditingController volumePompeTextEditingController =
        TextEditingController();
    final TextEditingController volumeDistribueTextEditingController =
        TextEditingController();
    final TextEditingController volumeEauJavelTextEditingController =
        TextEditingController();
    final TextEditingController tarifAdapteTextEditingController =
        TextEditingController();
    final TextEditingController coutEauTextEditingController =
        TextEditingController();
    final TextEditingController nombreJourTextEditingController =
        TextEditingController();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.primaryblue,
        drawer: const ApplicationDrawer(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.gNavigationService.openFicheGDAScreen(context);
                },
                child: SvgPicture.asset(
                  fit: BoxFit.contain,
                  width: 25,
                  color: Colors.white,
                  "assets/images/arrow-left-solid.svg",
                ),
              ),
              Text(
                AppLocalizations.of(context)!.donneesTechniquesTitre,
              ),
              GestureDetector(
                onTap: () {
                  context.gNavigationService
                      .openRecettesRealiseesScreen(context);
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.moisTitre,
                        style: const TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                    StatefulBuilder(
                      builder: (context, setState) => DropdownButton<String>(
                        isExpanded: true,
                        value: month,
                        items: months
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            month = newValue!;
                          });
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.anneeTitre,
                        style: const TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                    StatefulBuilder(
                      builder: (context, setState) => DropdownButton<String>(
                        isExpanded: true,
                        value: year,
                        items:
                            years.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            year = newValue!;
                          });
                        },
                      ),
                    ),
                    WidgetField(
                      enabled: true,
                      titre: "Volume pompé/acheté (m3)",
                      textEditingController: volumePompeTextEditingController,
                    ),
                    WidgetField(
                      enabled: true,
                      titre: "Volume distribué/facturé (m3)",
                      textEditingController:
                          volumeDistribueTextEditingController,
                    ),
                    WidgetField(
                      enabled: true,
                      titre: "Volume Eau de Javal utilisé (l)",
                      textEditingController:
                          volumeEauJavelTextEditingController,
                    ),
                    WidgetField(
                      enabled: true,
                      textEditingController: tarifAdapteTextEditingController,
                      titre: "Tarif adopté (m3 eau)",
                    ),
                    WidgetField(
                      enabled: true,
                      textEditingController: coutEauTextEditingController,
                      titre: "Coût m3 Eau",
                    ),
                    WidgetField(
                      enabled: true,
                      textEditingController: nombreJourTextEditingController,
                      titre: "Nombre de jours d’arrêt",
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
                                .openRecettesRealiseesScreen(context);
                          },
                          child: Text(AppLocalizations.of(context)!
                              .saisirLesRecettesTitre),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
