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
    int monthNumber = 1;

    const List<String> years = ['2019', '2020', '2021', '2022', '2023', '2024'];
    String gdaValue = "";
    String gouvernoratValue = "";
    TextEditingController gdaController = TextEditingController();
    ValueNotifier<String> _selectedItem = ValueNotifier<String>('janvier');
    String month = "janvier";
    String year = "2019";
    String _selectedOption = "Option 1";
    List<String> _gouvernorats = [
      'TUNIS',
      'ARIANA',
      'BEN AROUS',
      'MANOUBA',
      'NABEUL',
      'ZAGHOUANE',
      'BIZERTE',
      'BEJA',
      'JENDOUBA',
      'KEF',
      'SILIANA',
      'SOUSSE',
      'MONASTIR',
      'MEHDIA',
      'SFAX',
      'KAIROUAN',
      'KASSERINE',
      'SIDI BOUZID',
      'GABES',
      'MEDENINE',
      'TATAOUINE',
      'GAFSA',
      'TOZEUR',
      'KEBELI',
    ];
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
                            switch (month) {
                              case 'janvier':
                                monthNumber = 1;
                                break;
                              case 'février':
                                monthNumber = 2;
                                break;
                              case 'mars':
                                monthNumber = 3;
                                break;
                              case 'avril':
                                monthNumber = 4;
                                break;
                              case 'mai':
                                monthNumber = 5;
                                break;
                              case 'juin':
                                monthNumber = 6;
                                break;
                              case 'juillet':
                                monthNumber = 7;
                                break;
                              case 'août':
                                monthNumber = 8;
                                break;
                              case 'septembre':
                                monthNumber = 9;
                                break;
                              case 'octobre':
                                monthNumber = 10;
                                break;
                              case 'novembre':
                                monthNumber = 11;
                                break;
                              case 'décembre':
                                monthNumber = 12;
                                break;
                            }
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
                                    title: Column(
                                      children: [
                                        Text(AppLocalizations.of(context)!
                                            .gouvernoratTitre),
                                        const Divider(
                                          color: Colors.black,
                                        )
                                      ],
                                    ),
                                    content: SizedBox(
                                      height: 200,
                                      child: StatefulBuilder(
                                          builder: (context, setState) {
                                        return ListView.builder(
                                          itemCount: _gouvernorats.length,
                                          itemBuilder: (context, index) {
                                            return RadioListTile(
                                                title:
                                                    Text(_gouvernorats[index]),
                                                value: _gouvernorats[index],
                                                groupValue: _selectedOption,
                                                onChanged: (value) =>
                                                    setState(() {
                                                      _selectedOption = value!;
                                                    }));
                                          },
                                        );
                                      }),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .annulerTitre),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            context, _selectedOption),
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .okTitre),
                                      ),
                                    ],
                                  );
                                },
                              ).then((value) => gouvernoratValue = value);
                            },
                            child: DropdownButton<String>(
                              isExpanded: true,
                              items: const [],
                              iconDisabledColor: Colors.black,
                              onChanged: (String? newValue) {},
                            ),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 10,
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
                          builder: (BuildContext context) => Theme(
                              data: Theme.of(context).copyWith(
                                dialogBackgroundColor: AppColors.primaryblue,
                              ),
                              child: _buildPopupDialog(context)),
                        ).then((value) {
                          gdaValue = value;
                          gdaController.text = value;
                        });
                      },
                      child: TextField(
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                        controller: gdaController,
                        enabled: false,
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
                            // if (gdaValue.isEmpty) {
                            context.currentConsultationBloc
                                .choseMonthAndYear(month, year);
                            context.gNavigationService
                                .openIndicateursSpecifiqueScreen(
                                    context, monthNumber, int.parse(year));
                            // } else {
                            //   context.currentConsultationBloc
                            //       .choseAllfields(month, year, year);
                            //   context.gNavigationService
                            //       .openFicheGDAScreen(context);
                            // }
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
