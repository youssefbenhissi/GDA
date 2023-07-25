import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/specific_donnees_techniques/specific_donnees_techniques_bloc.dart';
import 'package:pfe_iheb/specific_fiche_gda_bloc/specific_fiche_gda_model.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:pfe_iheb/utils/field_widget.dart';

class SpecificDonneesTechniquesPage extends StatefulWidget {
  final String gda;
  final int month;
  final int year;
  const SpecificDonneesTechniquesPage({
    super.key,
    required this.gda,
    required this.month,
    required this.year,
  });

  @override
  State<SpecificDonneesTechniquesPage> createState() =>
      _SpecificDonneesTechniquesPageState();
}

class _SpecificDonneesTechniquesPageState
    extends State<SpecificDonneesTechniquesPage> {
  List<String> months = [
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
  List<String> years = [
    '2017',
    '2018',
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
    '2024'
  ];
  String month = "janvier";
  int monthNumber = 1;
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
  @override
  void initState() {
    setState(() {
      year = widget.year.toString();
      switch (widget.month) {
        case 1:
          month = 'janvier';
          break;
        case 2:
          month = 'février';
          break;
        case 3:
          month = 'mars';
          break;
        case 4:
          month = 'avril';
          break;
        case 5:
          month = 'mai';
          break;
        case 6:
          month = 'juin';
          break;
        case 7:
          month = 'juillet';
          break;
        case 8:
          month = 'août';
          break;
        case 9:
          month = 'septembre';
          break;
        case 10:
          month = 'octobre';
          break;
        case 11:
          month = 'novembre';
          break;
        case 12:
          month = 'décembre';
          break;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        body: BlocBuilder<SpecificDonneesTechniquesBloc,
                SpecificDonneesTechniquesState>(
            buildWhen: (prev, next) => prev.runtimeType != next.runtimeType,
            builder: (context, state) {
              if (state is LoadedSpecificDonneesTechniquesState) {
                volumePompeTextEditingController.text =
                    state.models[0].inputValue;
                volumeDistribueTextEditingController.text =
                    state.models[1].inputValue;
                volumeEauJavelTextEditingController.text =
                    state.models[2].inputValue;
                tarifAdapteTextEditingController.text =
                    state.models[3].inputValue;
                coutEauTextEditingController.text = state.models[4].inputValue;
                nombreJourTextEditingController.text =
                    state.models[5].inputValue;
                return Column(
                  children: [
                    ColoredBox(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, right: 8.0, left: 8.0),
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
                              builder: (context, setState) =>
                                  DropdownButton<String>(
                                isExpanded: true,
                                value: month,
                                items: months.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                    ),
                                  );
                                }).toList(),
                                onChanged: null,
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
                              builder: (context, setState) =>
                                  DropdownButton<String>(
                                isExpanded: true,
                                value: year,
                                items: years.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                    ),
                                  );
                                }).toList(),
                                onChanged: null,
                              ),
                            ),
                            WidgetField(
                              obscure: false,
                              enabled: false,
                              titre: AppLocalizations.of(context)!
                                  .volumePompeAcheteTitre,
                              textEditingController:
                                  volumePompeTextEditingController,
                            ),
                            WidgetField(
                              obscure: false,
                              enabled: false,
                              titre: AppLocalizations.of(context)!
                                  .volumeDistribueFactureTitre,
                              textEditingController:
                                  volumeDistribueTextEditingController,
                            ),
                            WidgetField(
                              obscure: false,
                              enabled: false,
                              titre: AppLocalizations.of(context)!
                                  .volumeEauDeJavalUtiliseTitre,
                              textEditingController:
                                  volumeEauJavelTextEditingController,
                            ),
                            WidgetField(
                              obscure: false,
                              enabled: false,
                              textEditingController:
                                  tarifAdapteTextEditingController,
                              titre: AppLocalizations.of(context)!
                                  .tarifAdopteTitre,
                            ),
                            WidgetField(
                              obscure: false,
                              enabled: false,
                              textEditingController:
                                  coutEauTextEditingController,
                              titre: AppLocalizations.of(context)!.coutEauTitre,
                            ),
                            WidgetField(
                              obscure: false,
                              enabled: false,
                              textEditingController:
                                  nombreJourTextEditingController,
                              titre: AppLocalizations.of(context)!
                                  .nombreDeJoursdarretTitre,
                            ),
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
                                        .openSpecificRecettesRealisees(
                                            context,
                                            widget.gda,
                                            widget.month,
                                            widget.year);
                                  },
                                  child: Text(AppLocalizations.of(context)!
                                      .lesRecettesTitre),
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
            }));
  }
}
