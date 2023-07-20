import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
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
                            switch (month) {
                              case 'janvier':
                                monthNumber = 1;
                                break;
                              case 'février':
                                monthNumber = 2;
                                break;
                              case 'mars':
                                monthNumber = 3;
                                break;
                              case 'avril':
                                monthNumber = 4;
                                break;
                              case 'mai':
                                monthNumber = 5;
                                break;
                              case 'juin':
                                monthNumber = 6;
                                break;
                              case 'juillet':
                                monthNumber = 7;
                                break;
                              case 'août':
                                monthNumber = 8;
                                break;
                              case 'septembre':
                                monthNumber = 9;
                                break;
                              case 'octobre':
                                monthNumber = 10;
                                break;
                              case 'novembre':
                                monthNumber = 11;
                                break;
                              case 'décembre':
                                monthNumber = 12;
                                break;
                            }
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
                      obscure: false,
                      enabled: true,
                      titre:
                          AppLocalizations.of(context)!.volumePompeAcheteTitre,
                      textEditingController: volumePompeTextEditingController,
                    ),
                    WidgetField(
                      obscure: false,
                      enabled: true,
                      titre: AppLocalizations.of(context)!
                          .volumeDistribueFactureTitre,
                      textEditingController:
                          volumeDistribueTextEditingController,
                    ),
                    WidgetField(
                      obscure: false,
                      enabled: true,
                      titre: AppLocalizations.of(context)!
                          .volumeEauDeJavalUtiliseTitre,
                      textEditingController:
                          volumeEauJavelTextEditingController,
                    ),
                    WidgetField(
                      obscure: false,
                      enabled: true,
                      textEditingController: tarifAdapteTextEditingController,
                      titre: AppLocalizations.of(context)!.tarifAdopteTitre,
                    ),
                    WidgetField(
                      obscure: false,
                      enabled: true,
                      textEditingController: coutEauTextEditingController,
                      titre: AppLocalizations.of(context)!.coutEauTitre,
                    ),
                    WidgetField(
                      obscure: false,
                      enabled: true,
                      textEditingController: nombreJourTextEditingController,
                      titre: AppLocalizations.of(context)!
                          .nombreDeJoursdarretTitre,
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
                            var state = context.currentLoginBloc.state;
                            if (state is GDALoginState) {
                              context.currentDonneesTechniquesBloc
                                  .insertDonneesTechniques(
                                createdBy: state.model.login,
                                inputValueVolumePompe:
                                    volumePompeTextEditingController.text,
                                idIndicateurVolumePompe: 2,
                                inputValueVolumeDistribue:
                                    volumeDistribueTextEditingController.text,
                                idIndicateurVolumeDistribue: 4,
                                inputValueVolumeEauDeJavel:
                                    volumeEauJavelTextEditingController.text,
                                idIndicateurVolumeEauDeJavel: 10,
                                inputValueTarifAdopte:
                                    tarifAdapteTextEditingController.text,
                                idIndicateurTarifAdopte: 41,
                                inputValueCoutEau:
                                    coutEauTextEditingController.text,
                                idIndicateurCoutEau: 40,
                                inputValueNombreDeJoursArret:
                                    nombreJourTextEditingController.text,
                                idIndicateur: 1,
                                idSaisie: state.model.id,
                                month: monthNumber,
                                year: int.tryParse(year) ?? 2023,
                              );
                            } else if (state is DecideurCentralLoginState) {
                              context.currentDonneesTechniquesBloc
                                  .insertDonneesTechniques(
                                createdBy: state.model.login,
                                inputValueVolumePompe:
                                    volumePompeTextEditingController.text,
                                idIndicateurVolumePompe: 2,
                                inputValueVolumeDistribue:
                                    volumeDistribueTextEditingController.text,
                                idIndicateurVolumeDistribue: 4,
                                inputValueVolumeEauDeJavel:
                                    volumeEauJavelTextEditingController.text,
                                idIndicateurVolumeEauDeJavel: 10,
                                inputValueTarifAdopte:
                                    tarifAdapteTextEditingController.text,
                                idIndicateurTarifAdopte: 41,
                                inputValueCoutEau:
                                    coutEauTextEditingController.text,
                                idIndicateurCoutEau: 40,
                                inputValueNombreDeJoursArret:
                                    nombreJourTextEditingController.text,
                                idIndicateur: 1,
                                idSaisie: state.model.id,
                                month: monthNumber,
                                year: int.tryParse(year) ?? 2023,
                              );
                            } else if (state is DecideurGouvernoratLoginState) {
                              context.currentDonneesTechniquesBloc
                                  .insertDonneesTechniques(
                                createdBy: state.model.login,
                                inputValueVolumePompe:
                                    volumePompeTextEditingController.text,
                                idIndicateurVolumePompe: 2,
                                inputValueVolumeDistribue:
                                    volumeDistribueTextEditingController.text,
                                idIndicateurVolumeDistribue: 4,
                                inputValueVolumeEauDeJavel:
                                    volumeEauJavelTextEditingController.text,
                                idIndicateurVolumeEauDeJavel: 10,
                                inputValueTarifAdopte:
                                    tarifAdapteTextEditingController.text,
                                idIndicateurTarifAdopte: 41,
                                inputValueCoutEau:
                                    coutEauTextEditingController.text,
                                idIndicateurCoutEau: 40,
                                inputValueNombreDeJoursArret:
                                    nombreJourTextEditingController.text,
                                idIndicateur: 1,
                                idSaisie: state.model.id,
                                month: monthNumber,
                                year: int.tryParse(year) ?? 2023,
                              );
                            }
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
