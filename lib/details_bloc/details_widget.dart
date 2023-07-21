import 'package:flutter/material.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/fiche_gda_bloc/fiche_gda_model.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsPage extends StatelessWidget {
  final FicheGDAModel modele;
  const DetailsPage({super.key, required this.modele});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryblue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                fit: BoxFit.contain,
                width: 25,
                color: Colors.white,
                "assets/images/cross.png",
              ),
            ),
          ),
        ],
        title: Text(
          AppLocalizations.of(context)!.detailsTitre,
        ),
      ),
      body: SingleChildScrollView(
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!.dateDeCreationTitre,
                    style: const TextStyle(color: Colors.lightBlue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    modele.dateCreation ?? '',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.nomDuPresidentTitre,
                    style: const TextStyle(color: Colors.lightBlue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    modele.nomPresident ?? '',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.numeroDuTelephone,
                    style: const TextStyle(color: Colors.lightBlue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    modele.telPresident ?? '',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.nomDirecteurTechniqueTitre,
                    style: const TextStyle(color: Colors.lightBlue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    modele.nomDirTechnique ?? '',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.numeroDuTelephone,
                    style: const TextStyle(color: Colors.lightBlue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    modele.telDirTechnique ?? '',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.nomSAEPTitre,
                    style: const TextStyle(color: Colors.lightBlue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    modele.nomSaep ?? '',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.dateDeMiseEnServiceTitre,
                    style: const TextStyle(color: Colors.lightBlue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    modele.dateMiseService ?? '',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.sourceDEauTitre,
                    style: const TextStyle(color: Colors.lightBlue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      modele.srcEauForage == 0
                          ? Container(
                              width:
                                  12, // Adjust the width of the square as needed
                              height:
                                  12, // Adjust the height of the square as needed
                              decoration: BoxDecoration(
                                color:
                                    Colors.white, // Set the fill color to white
                                border: Border.all(
                                  color: Colors
                                      .black, // Set the border color to black
                                  width: 2, // Set the border width as needed
                                ),
                              ),
                            )
                          : Container(
                              width:
                                  12, // Adjust the width of the square as needed
                              height:
                                  12, // Adjust the height of the square as needed
                              decoration: BoxDecoration(
                                color:
                                    Colors.black, // Set the fill color to white
                                border: Border.all(
                                  color: Colors
                                      .black, // Set the border color to black
                                  width: 2, // Set the border width as needed
                                ),
                              ),
                            ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(AppLocalizations.of(context)!.forageTitre)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      modele.srcEauPiquageGr == 0
                          ? Container(
                              width:
                                  12, // Adjust the width of the square as needed
                              height:
                                  12, // Adjust the height of the square as needed
                              decoration: BoxDecoration(
                                color:
                                    Colors.white, // Set the fill color to white
                                border: Border.all(
                                  color: Colors
                                      .black, // Set the border color to black
                                  width: 2, // Set the border width as needed
                                ),
                              ),
                            )
                          : Container(
                              width:
                                  12, // Adjust the width of the square as needed
                              height:
                                  12, // Adjust the height of the square as needed
                              decoration: BoxDecoration(
                                color:
                                    Colors.black, // Set the fill color to white
                                border: Border.all(
                                  color: Colors
                                      .black, // Set the border color to black
                                  width: 2, // Set the border width as needed
                                ),
                              ),
                            ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(AppLocalizations.of(context)!.piquageGRTitre)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      modele.srcEauPiquageSonede == 0
                          ? Container(
                              width:
                                  12, // Adjust the width of the square as needed
                              height:
                                  12, // Adjust the height of the square as needed
                              decoration: BoxDecoration(
                                color:
                                    Colors.white, // Set the fill color to white
                                border: Border.all(
                                  color: Colors
                                      .black, // Set the border color to black
                                  width: 2, // Set the border width as needed
                                ),
                              ),
                            )
                          : Container(
                              width:
                                  12, // Adjust the width of the square as needed
                              height:
                                  12, // Adjust the height of the square as needed
                              decoration: BoxDecoration(
                                color:
                                    Colors.black, // Set the fill color to white
                                border: Border.all(
                                  color: Colors
                                      .black, // Set the border color to black
                                  width: 2, // Set the border width as needed
                                ),
                              ),
                            ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(AppLocalizations.of(context)!.piquageSONEDETitre)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      modele.srcEauPuit == 0
                          ? Container(
                              width:
                                  12, // Adjust the width of the square as needed
                              height:
                                  12, // Adjust the height of the square as needed
                              decoration: BoxDecoration(
                                color:
                                    Colors.white, // Set the fill color to white
                                border: Border.all(
                                  color: Colors
                                      .black, // Set the border color to black
                                  width: 2, // Set the border width as needed
                                ),
                              ),
                            )
                          : Container(
                              width:
                                  12, // Adjust the width of the square as needed
                              height:
                                  12, // Adjust the height of the square as needed
                              decoration: BoxDecoration(
                                color:
                                    Colors.black, // Set the fill color to white
                                border: Border.all(
                                  color: Colors
                                      .black, // Set the border color to black
                                  width: 2, // Set the border width as needed
                                ),
                              ),
                            ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(AppLocalizations.of(context)!.puitsDeSurfaceTitre)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      modele.srcEauSourceNaturelle == 0
                          ? Container(
                              width:
                                  12, // Adjust the width of the square as needed
                              height:
                                  12, // Adjust the height of the square as needed
                              decoration: BoxDecoration(
                                color:
                                    Colors.white, // Set the fill color to white
                                border: Border.all(
                                  color: Colors
                                      .black, // Set the border color to black
                                  width: 2, // Set the border width as needed
                                ),
                              ),
                            )
                          : Container(
                              width:
                                  12, // Adjust the width of the square as needed
                              height:
                                  12, // Adjust the height of the square as needed
                              decoration: BoxDecoration(
                                color:
                                    Colors.black, // Set the fill color to white
                                border: Border.all(
                                  color: Colors
                                      .black, // Set the border color to black
                                  width: 2, // Set the border width as needed
                                ),
                              ),
                            ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(AppLocalizations.of(context)!.sourceNaturelleTitre)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.nombreDeBeneficiairesTitre,
                    style: const TextStyle(color: Colors.lightBlue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    modele.nbBeneficiaires.toString(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.green,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.longueurDeReseauTitre,
                    style: const TextStyle(color: Colors.lightBlue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    modele.longueurReseau.toString(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.nombreStationsDePompageTitre,
                    style: const TextStyle(color: Colors.lightBlue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    modele.nbStationsPompage.toString(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.nombreReservoireTitre,
                    style: const TextStyle(color: Colors.lightBlue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    modele.nbReservoirs.toString(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.nombreBITitre,
                    style: const TextStyle(color: Colors.lightBlue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    modele.nbBi.toString(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.nombreBEPTitre,
                    style: const TextStyle(color: Colors.lightBlue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    modele.nbBep.toString(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
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
                              .openDonneesTechniquesScreen(context);
                        },
                        child: Text(AppLocalizations.of(context)!
                            .saisirLesDonneesTechniquesTitre),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
