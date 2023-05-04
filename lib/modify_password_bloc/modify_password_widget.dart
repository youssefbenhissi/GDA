import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:pfe_iheb/utils/field_widget.dart';

class ModifyPasswordScreen extends StatelessWidget {
  const ModifyPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmNewPasswordController =
        TextEditingController();
    Locale currentLocale = Localizations.localeOf(context);
    String currentLanguage = currentLocale.languageCode;
    print("*" * 80);
    print(currentLanguage);
    // Use the currentLanguage variable as per your requirement.
    return Scaffold(
      appBar: AppBar(
          title: Text(
        AppLocalizations.of(context)!.modifierMotdePasseTitre,
      )),
      drawer: const ApplicationDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10),
        child: Column(
          children: [
            WidgetField(
              enabled: true,
              textEditingController: passwordController,
              titre: AppLocalizations.of(context)!.motDePasseTitre,
            ),
            const SizedBox(
              height: 25,
            ),
            WidgetField(
              enabled: true,
              textEditingController: newPasswordController,
              titre: AppLocalizations.of(context)!.nouveauMotDePasseTitre,
            ),
            const SizedBox(
              height: 25,
            ),
            WidgetField(
              enabled: true,
              textEditingController: confirmNewPasswordController,
              titre: AppLocalizations.of(context)!.confirmerMotDePasseTitre,
            ),
            const SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 8.0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    final String newPassword = newPasswordController.value.text;
                    final String confirmNewPassword =
                        confirmNewPasswordController.value.text;
                    if (newPassword != confirmNewPassword) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title:
                              Text(AppLocalizations.of(context)!.erreurTitre),
                          content: Text(AppLocalizations.of(context)!
                              .confirmPasswordTitre),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                  AppLocalizations.of(context)!.daccordTitre),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ),
                      );
                    }
                  },
                  child: Text(AppLocalizations.of(context)!.changerTitre),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
