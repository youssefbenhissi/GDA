import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/fiche_gda_bloc/fiche_gda_bloc.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.currentFicheGDABloc.state;
    if (state is LoadedFicheGDAState) {
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
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    fit: BoxFit.contain,
                    width: 25,
                    color: Colors.white,
                    "assets/images/cross.png",
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.detailsTitre,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    fit: BoxFit.contain,
                    width: 25,
                    color: Colors.white,
                    "assets/images/tick.png",
                  ),
                ),
              ],
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
                    const Text(
                      'Date De Création',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.model.dateCreation ?? '',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Nom du Président',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.model.nomPresident!,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'N° Tél',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.model.telPresident!,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Nom Directeur Technique',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.model.nomDirTechnique!,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'N° Tél',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.model.telDirTechnique!,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Nom SAEP',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.model.nomSaep!,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Date de mise en service',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.model.dateMiseService!,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Source d\'eau',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        state.model.srcEauForage == 0
                            ? Container(
                                width:
                                    12, // Adjust the width of the square as needed
                                height:
                                    12, // Adjust the height of the square as needed
                                decoration: BoxDecoration(
                                  color: Colors
                                      .white, // Set the fill color to white
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
                                  color: Colors
                                      .black, // Set the fill color to white
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
                        const Text("Forage")
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
                        state.model.srcEauPiquageGr == 0
                            ? Container(
                                width:
                                    12, // Adjust the width of the square as needed
                                height:
                                    12, // Adjust the height of the square as needed
                                decoration: BoxDecoration(
                                  color: Colors
                                      .white, // Set the fill color to white
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
                                  color: Colors
                                      .black, // Set the fill color to white
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
                        const Text("Piquage GR")
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
                        state.model.srcEauPiquageSonede == 0
                            ? Container(
                                width:
                                    12, // Adjust the width of the square as needed
                                height:
                                    12, // Adjust the height of the square as needed
                                decoration: BoxDecoration(
                                  color: Colors
                                      .white, // Set the fill color to white
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
                                  color: Colors
                                      .black, // Set the fill color to white
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
                        const Text("Piquage SONEDE")
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
                        state.model.srcEauPuit == 0
                            ? Container(
                                width:
                                    12, // Adjust the width of the square as needed
                                height:
                                    12, // Adjust the height of the square as needed
                                decoration: BoxDecoration(
                                  color: Colors
                                      .white, // Set the fill color to white
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
                                  color: Colors
                                      .black, // Set the fill color to white
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
                        const Text("Puits de surface")
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
                        state.model.srcEauSourceNaturelle == 0
                            ? Container(
                                width:
                                    12, // Adjust the width of the square as needed
                                height:
                                    12, // Adjust the height of the square as needed
                                decoration: BoxDecoration(
                                  color: Colors
                                      .white, // Set the fill color to white
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
                                  color: Colors
                                      .black, // Set the fill color to white
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
                        const Text("S. Naturelle")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Nombre de bénéficiaires',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.model.nbBeneficiaires.toString(),
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
                    const Text(
                      'ur de réseau',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.model.longueurReseau.toString(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Nombre stations de pompage',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.model.nbStationsPompage.toString(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Nombre réservoire',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.model.nbReservoirs.toString(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Nombre BI',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.model.nbBi.toString(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Nombre BEP',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.model.nbBep.toString(),
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
          )));
    }
    return const CupertinoActivityIndicator();
  }
}
