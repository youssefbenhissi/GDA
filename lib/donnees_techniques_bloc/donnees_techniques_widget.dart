import 'package:flutter/material.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/utils/drawer.dart';

class SaisirDonneesTechniquesPage extends StatelessWidget {
  const SaisirDonneesTechniquesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.primaryblue,
        drawer: const ApplicationDrawer(),
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!.donneesTechniquesTitre,
        )),
        body: const Center(
          child: Text('saisir données techniques'),
        ));
  }
}
