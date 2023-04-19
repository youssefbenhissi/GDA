import 'package:flutter/material.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/provider/locale_provider.dart';
import 'package:pfe_iheb/utils/app_colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:provider/provider.dart';

class ModifyPasswordScreen extends StatelessWidget {
  const ModifyPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmNewPasswordController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
          title: Text(
        AppLocalizations.of(context)!.modifierMotdePasseTitre,
      )),
      drawer: const ApplicationDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.motDePasseTitre,
                    hintStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 13),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: newPasswordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    hintText:
                        AppLocalizations.of(context)!.nouveauMotDePasseTitre,
                    hintStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 13),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: confirmNewPasswordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    hintText:
                        AppLocalizations.of(context)!.confirmerMotDePasseTitre,
                    hintStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 13),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  final String newPassword = newPasswordController.value.text;
                  final String confirmNewPassword =
                      confirmNewPasswordController.value.text;
                  if (newPassword != confirmNewPassword) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(AppLocalizations.of(context)!.erreurTitre),
                        content: Text(
                            AppLocalizations.of(context)!.confirmPasswordTitre),
                        actions: <Widget>[
                          TextButton(
                            child: Text(AppLocalizations.of(context)!.okTitre),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)))),
                child: Text(
                  AppLocalizations.of(context)!.changerTitre,
                  style: const TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}
