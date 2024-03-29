import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/fiche_gda_bloc/fiche_gda_bloc.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/utils/popup_notification.dart';

class FicheGDAPage extends StatelessWidget {
  const FicheGDAPage({super.key});

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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: GestureDetector(
              onTap: () {
                context.gNavigationService.openDonneesTechniquesScreen(context);
              },
              child: Directionality.of(context) == TextDirection.rtl
                  ? SvgPicture.asset(
                      "assets/images/arrow-left-solid.svg",
                      fit: BoxFit.contain,
                      width: 25,
                      color: Colors.white,
                    )
                  : SvgPicture.asset(
                      "assets/images/arrow-right-solid.svg",
                      fit: BoxFit.contain,
                      width: 25,
                      color: Colors.white,
                    ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<FicheGDABloc, FicheGDAState>(
        buildWhen: (prev, next) => prev.runtimeType != next.runtimeType,
        builder: (context, state) {
          if (state is LoadedFicheGDAState) {
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
                        Text(
                          AppLocalizations.of(context)!.gouvernoratTitre,
                          style: const TextStyle(color: Colors.lightBlue),
                        ),
                        Text(state.model.idGouv.toString()),
                        Text(currentLanguage == "fr"
                            ? state.model.nomGouvFr
                            : state.model.nomGouvAr),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.delegationTitre,
                          style: const TextStyle(color: Colors.lightBlue),
                        ),
                        Text(state.model.idDelegation.toString()),
                        Text(currentLanguage == "fr"
                            ? state.model.refdelegationfrancais
                            : state.model.refdelegationarabe),
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
                        Text(currentLanguage == "fr"
                            ? state.model.rgdfrancais
                            : state.model.rgdarabe),
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
                              .openDetailsScreen(context, state.model);
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
