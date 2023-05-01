import 'package:flutter/material.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/login_bloc/login_bloc.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:searchfield/searchfield.dart';
part 'gda_popup.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({Key? key}) : super(key: key);

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  @override
  Widget build(BuildContext context) {
    var state = context.currentLoginBloc.state;
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
    String gdaValue = "";
    String gouvernoratValue = "";
    ValueNotifier<String> _selectedItem = ValueNotifier<String>('janvier');
    String month = "janvier";
    String year = "2019";
    String _selectedOption = "Option 1";
    List<String> _options = ['Option 1', 'Option 2', 'Option 3'];
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
                    StatefulBuilder(
                      builder: (context, setState) => DropdownButton<String>(
                        isExpanded: true,
                        value: month,
                        items: months
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            month = newValue!;
                          });
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.anneeTitre,
                        style: const TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                    StatefulBuilder(
                      builder: (context, setState) => DropdownButton<String>(
                        isExpanded: true,
                        value: year,
                        items:
                            years.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            year = newValue!;
                          });
                        },
                      ),
                    ),
                    state is! DecideurCentralLoginState
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              AppLocalizations.of(context)!.gouvernoratTitre,
                              style: const TextStyle(color: Colors.lightBlue),
                            ),
                          )
                        : const SizedBox.shrink(),
                    state is! DecideurCentralLoginState
                        ? InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Select an option'),
                                    content: StatefulBuilder(
                                        builder: (context, _setState) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: _options
                                            .map((option) => RadioListTile(
                                                title: Text(option),
                                                value: option,
                                                groupValue: _selectedOption,
                                                onChanged: (value) =>
                                                    _setState(() {
                                                      _selectedOption = value!;
                                                    })))
                                            .toList(),
                                      );
                                    }),
                                    actions: [
                                      FloatingActionButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Cancel'),
                                      ),
                                      FloatingActionButton(
                                        onPressed: () => Navigator.pop(
                                            context, _selectedOption),
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: DropdownButton<String>(
                              isExpanded: true,
                              items: const [],
                              iconDisabledColor: Colors.black,
                              onChanged: (String? newValue) {},
                            ),
                          )
                        : const SizedBox.shrink(),
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
                          builder: (BuildContext context) => Theme(
                              data: Theme.of(context).copyWith(
                                dialogBackgroundColor: AppColors.primaryblue,
                              ),
                              child: _buildPopupDialog(context)),
                        ).then((value) => gdaValue = value);
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
                            if (state is DecideurGouvernoratLoginState) {
                              if (gdaValue.isEmpty) {
                                context.currentConsultationBloc
                                    .choseMonthAndYear(month, year);
                                context.gNavigationService
                                    .openIndicateursSpecifiqueScreen(context);
                              } else {
                                context.currentConsultationBloc
                                    .choseAllfields(month, year, year);
                                context.gNavigationService
                                    .openFicheGDAScreen(context);
                              }
                            } else {}
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
