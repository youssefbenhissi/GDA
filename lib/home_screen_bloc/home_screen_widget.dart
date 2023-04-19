import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        backgroundColor: AppColors.primaryblue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100, // ajustez cette valeur selon vos besoins
              child: DrawerHeader(
                child: Text(AppLocalizations.of(context)!.menuTitre,
                    style: const TextStyle(color: Colors.white, fontSize: 30)),
              ),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.ficheDGATitre,
                  style: const TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            const Divider(color: Colors.white),
            ListTile(
              title: Text(AppLocalizations.of(context)!.saisirDonneesTitre,
                  style: const TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.consultationTitre,
                  style: const TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.statistiquesTitre,
                  style: const TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              title:  Text(AppLocalizations.of(context)!.modifierMotdePasseTitre,
                  style: const TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              title:  Text(AppLocalizations.of(context)!.deconnexionTitre,
                  style: const TextStyle(color: Colors.white)),
              onTap: () {
                context.gNavigationService.openLoginScreen(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
