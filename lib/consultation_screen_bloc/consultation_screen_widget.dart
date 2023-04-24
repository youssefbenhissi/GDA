import 'package:flutter/material.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:searchfield/searchfield.dart';
part 'gda_popup.dart';

class ConsultationPage extends StatelessWidget {
  const ConsultationPage({super.key});
  @override
  Widget build(BuildContext context) {
    const List<String> months = [
      'janvier',
      'février',
      'mars',
      'avril',
      'mai',
      'juin',
      'juillet',
      'août',
      'septembre',
      'octobre',
      'novembre',
      'décembre',
    ];
    const List<String> years = ['2019', '2020', '2021', '2022', '2023', '2024'];
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.primaryblue,
        drawer: const ApplicationDrawer(),
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!.consultationTitre,
        )),
        body: Column(
          children: [
            ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.moisTitre,
                        style: const TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                    DropdownButton<String>(
                      isExpanded: true,
                      value: months.first,
                      items:
                          months.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {},
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.anneeTitre,
                        style: const TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                    DropdownButton<String>(
                      isExpanded: true,
                      value: years.first,
                      items:
                          years.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {},
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.gdaTitre,
                        style: const TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildPopupDialog(context),
                        );
                      },
                      child: DropdownButton<String>(
                        isExpanded: true,
                        items: const [],
                        iconDisabledColor: Colors.black,
                        onChanged: (String? newValue) {},
                      ),
                    ),
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
                            print("*" * 80);
                          },
                          child: Text(
                              AppLocalizations.of(context)!.consulterTitre),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
