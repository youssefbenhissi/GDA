import 'package:flutter/material.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/provider/locale_provider.dart';
import 'package:pfe_iheb/utils/app_colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ModifyPasswordScreen extends StatelessWidget {
  const ModifyPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.primaryblue,
        body: Container(
          child: const Text("modify password"),
        ));
  }
}
