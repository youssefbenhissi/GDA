import 'package:flutter/material.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/provider/locale_provider.dart';
import 'package:pfe_iheb/utils/app_colors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryblue,
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 200, 10, 10),
        height: 450,
        width: 450,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/logo2.jpg", height: 90),
                  Image.asset("assets/images/Logo.jpg", height: 90),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText:
                            AppLocalizations.of(context)!.identifiantTitre,
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
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.motDePasseTitre,
                        hintStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 13),
                        enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.5, color: Colors.grey)),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final String email = emailController.value.text;
                      final String password = passwordController.value.text;
                      if (email.isEmpty || password.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title:
                                Text(AppLocalizations.of(context)!.erreurTitre),
                            content: Text(AppLocalizations.of(context)!
                                .veuillezRemplirTousLesChampsTitre),
                            actions: <Widget>[
                              TextButton(
                                child:
                                    Text(AppLocalizations.of(context)!.okTitre),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                        );
                      } else {
                        context.currentLoginBloc.login(email, password);
                        await Future.delayed(const Duration(milliseconds: 20))
                            .then((value) {
                          var loginState = context.currentLoginBloc.state;
                          if (loginState is! FailedLoginState &&
                              loginState is! InitialLoginState) {
                            if (loginState is GDALoginState) {
                              context.gNavigationService
                                  .openFicheGDAScreen(context);
                            } else {
                              context.gNavigationService
                                  .openIndicateursScreen(context);
                            }
                          }
                        });
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)))),
                    child: Text(
                      AppLocalizations.of(context)!.connexionTitre,
                      style: const TextStyle(color: Colors.black),
                    )),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          final provider = Provider.of<LocaleProvider>(context,
                              listen: false);

                          provider.setLocale(const Locale('fr'));
                        },
                        child: const Text("FRANÇAIS",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ))),
                    TextButton(
                        onPressed: () {
                          final provider = Provider.of<LocaleProvider>(context,
                              listen: false);

                          provider.setLocale(const Locale('ar'));
                        },
                        child: const Text("العربية",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ))),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
