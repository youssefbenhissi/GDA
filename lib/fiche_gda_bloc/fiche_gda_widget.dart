import 'package:flutter/material.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FicheGDAPage extends StatelessWidget {
  const FicheGDAPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_right_alt,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: ColoredBox(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Gouvernorat",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                  Text("41"),
                  Text("KAIROUAN"),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Délégation",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                  Text("4145"),
                  Text("Sbikha"),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "GDA",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                  Text("4145"),
                  Text("KAIROUAN"),
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
                    context.gNavigationService.openDetailsScreen(context);
                  },
                  child: Text(AppLocalizations.of(context)!.detailsGDATitre),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
