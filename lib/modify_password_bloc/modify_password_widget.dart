import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/modify_password_bloc/modify_password_bloc.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:pfe_iheb/utils/field_widget.dart';
import 'package:pfe_iheb/utils/popup_notification.dart';
import 'package:pfe_iheb/utils/shared_preferences_helper.dart';

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
        padding: const EdgeInsets.only(top: 15.0, left: 10),
        child: Column(
          children: [
            WidgetField(
              obscure: true,
              enabled: true,
              textEditingController: passwordController,
              titre: AppLocalizations.of(context)!.motDePasseTitre,
            ),
            const SizedBox(
              height: 25,
            ),
            WidgetField(
              obscure: true,
              enabled: true,
              textEditingController: newPasswordController,
              titre: AppLocalizations.of(context)!.nouveauMotDePasseTitre,
            ),
            const SizedBox(
              height: 25,
            ),
            WidgetField(
              obscure: true,
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
                  onPressed: () async {
                    final String newPassword = newPasswordController.value.text;
                    final String confirmNewPassword =
                        confirmNewPasswordController.value.text;
                    if (newPassword != confirmNewPassword) {
                      ErrorPopUpNotification.create(
                        context: context,
                        title:
                            AppLocalizations.of(context)!.wrongCredentialsTitre,
                        message:
                            AppLocalizations.of(context)!.wrongCredentialsTitre,
                      );
                    } else {
                      String? email = await SharedPreferencesHelper.getValue(
                          SharedPreferencesHelper.LOGIN_STRING);
                      String? oldPassword =
                          await SharedPreferencesHelper.getValue(
                              SharedPreferencesHelper.PASSWORD_STRING);
                      print("*" * 80);
                      print(newPassword);
                      print(oldPassword);
                      if (oldPassword != passwordController.text) {
                        ErrorPopUpNotification.create(
                          context: context,
                          title: AppLocalizations.of(context)!
                              .wrongCredentialsTitre,
                          message: "l'ancien mot de passe est erroné",
                        );
                      } else {
                        context.currentModifyPasswordBloc.modifyPassword(
                            username: email!, password: confirmNewPassword);
                        await Future.delayed(const Duration(milliseconds: 200))
                            .then((value) {
                          var modifyPasswordState =
                              context.currentModifyPasswordBloc.state;
                          if (modifyPasswordState
                              is SuccededModifyPasswordState) {
                            SuccessPopUpNotification.create(
                              context: context,
                              title: AppLocalizations.of(context)!
                                  .miseajourMotDePasseTitre,
                              message: AppLocalizations.of(context)!
                                  .votreMotDePasseEstMisaJourAvecSuccesTitre,
                            );
                          } else {
                            if (modifyPasswordState
                                    is FailedModifyPasswordState ||
                                modifyPasswordState
                                    is InitialModifyPasswordState) {
                              ErrorPopUpNotification.create(
                                context: context,
                                title: AppLocalizations.of(context)!
                                    .wrongCredentialsTitre,
                                message: AppLocalizations.of(context)!
                                    .wrongCredentialsTitre,
                              );
                            }
                          }
                        });
                      }
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
