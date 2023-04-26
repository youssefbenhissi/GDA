import 'package:flutter/material.dart';
import 'package:pfe_iheb/statistics_bloc/statistic_card_widget.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.primaryblue,
        drawer: const ApplicationDrawer(),
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!.detailsTitre,
        )),
        body: const Center(
          child: Text('Details'),
        ));
  }
}
