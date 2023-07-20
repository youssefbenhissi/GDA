import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/fiche_gda_bloc/fiche_gda_bloc.dart';
import 'package:pfe_iheb/specific_fiche_gda_bloc/specific_fiche_gda_bloc.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/utils/popup_notification.dart';

class SpecificFicheGDAPage extends StatelessWidget {
  const SpecificFicheGDAPage({super.key});

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    String currentLanguage = currentLocale.languageCode;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryblue,
      drawer: const ApplicationDrawer(),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.donnesIdentificationTitre,
        ),
      ),
      body: BlocBuilder<SpecificFicheGDABloc, SpecificFicheGDAState>(
        buildWhen: (prev, next) => prev.runtimeType != next.runtimeType,
        builder: (context, state) {
          if (state is LoadedSpecificFicheGDAState) {
            return ColoredBox(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Gouvernorat",
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                        Text(state.model.idGouv.toString()),
                        Text(currentLanguage == "fr"
                            ? state.model.nomGouvernoratFrancais
                            : state.model.nomGouvernoratArabe),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Délégation",
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                        Text(state.model.idDelegation.toString()),
                        const Text("Sbikha"),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "GDA",
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                        Text(state.model.code.toString()),
                        const Text("KAIROUAN"),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/goutte.png",
                  ),
                  const Divider(),
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
                              .openSpecificDonneesTechniques(
                                  context, state.model);
                        },
                        child:
                            Text(AppLocalizations.of(context)!.detailsGDATitre),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else if (state is LoadingFicheGDAState) {
            return const CupertinoActivityIndicator();
          } else if (state is FailedFicheGDAState) {
            ErrorPopUpNotification.create(
              context: context,
              title: "Quelque chose qui cloche",
              message: "Y a pas de données depuis la base de données",
            );
          }
          return const Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }
}
