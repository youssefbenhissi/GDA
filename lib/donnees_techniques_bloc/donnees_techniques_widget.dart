import 'package:flutter/material.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/utils/drawer.dart';
part 'field_widget.dart';

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
            title: Text(
          AppLocalizations.of(context)!.donneesTechniquesTitre,
        )),
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
                      titre: "Volume pompé/acheté (m3)",
                      textEditingController: volumePompeTextEditingController,
                    ),
                    WidgetField(
                      titre: "Volume distribué/facturé (m3)",
                      textEditingController:
                          volumeDistribueTextEditingController,
                    ),
                    WidgetField(
                      titre: "Volume Eau de Javal utilisé (l)",
                      textEditingController:
                          volumeEauJavelTextEditingController,
                    ),
                    WidgetField(
                      textEditingController: tarifAdapteTextEditingController,
                      titre: "Tarif adopté (m3 eau)",
                    ),
                    WidgetField(
                      textEditingController: coutEauTextEditingController,
                      titre: "Coût m3 Eau",
                    ),
                    WidgetField(
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
                          onPressed: () {},
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
