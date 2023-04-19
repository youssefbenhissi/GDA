import 'package:flutter/material.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/utils/app_colors.dart';

class ApplicationDrawer extends StatelessWidget {
  const ApplicationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryblue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 100,
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
            onTap: () {
              context.gNavigationService.openStatisticsScreen(context);
            },
          ),
          const Divider(
            color: Colors.white,
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.modifierMotdePasseTitre,
                style: const TextStyle(color: Colors.white)),
            onTap: () {
              context.gNavigationService.openModifyPasswordScreen(context);
            },
          ),
          const Divider(
            color: Colors.white,
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.deconnexionTitre,
                style: const TextStyle(color: Colors.white)),
            onTap: () {
              context.gNavigationService.openLoginScreen(context);
            },
          ),
        ],
      ),
    );
  }
}
