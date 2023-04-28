import 'package:flutter/material.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.primaryblue,
        appBar: AppBar(
            leading: SizedBox(
              height: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  height: 10,
                  "assets/images/cross.png",
                ),
              ),
            ),
            centerTitle: true,
            actions: <Widget>[
              SizedBox(
                height: 10,
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/tick.png",
                  ),
                ),
              ),
            ],
            title: Text(
              AppLocalizations.of(context)!.detailsTitre,
            )),
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
                  const Text(
                    '2019-03-15',
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
                  const Text(
                    '',
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
                  const Text(
                    '',
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
                  const Text(
                    '',
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
                  const Text(
                    '',
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
                  const Text(
                    '',
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
                  const Text(
                    '2019-03-15',
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
                    children: const [
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 12.0,
                        height: 12.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Forage")
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
                    children: const [
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 12.0,
                        height: 12.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Piquage GR")
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
                    children: const [
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 12.0,
                        height: 12.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Piquage SONEDE")
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
                    children: const [
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 12.0,
                        height: 12.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Puits de surface")
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
                    children: const [
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 12.0,
                        height: 12.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("S. Naturelle")
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
                  const Text(
                    '3600',
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
                  const Text(
                    '',
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
                  const Text(
                    '',
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
                  const Text(
                    '',
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
                  const Text(
                    '',
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
                  const Text(
                    '',
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
}
