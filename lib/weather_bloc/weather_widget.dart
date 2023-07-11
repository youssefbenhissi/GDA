import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:pfe_iheb/weather_bloc/http.dart';
import 'package:pfe_iheb/weather_bloc/weather_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Weather client = Weather();
  WeatherModel? data;
  String selectedOption = "Option 1";
  String gouvernoratValue = "TUNIS";
  List<String> gouvernorats = [
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
  Future<void> getData() async {
    data = await client.getWeather(gouvernoratValue);
  }

  void _reloadPage(String gouv) {
    setState(() {
      // Perform any necessary data reloading or updates here
      gouvernoratValue = gouv; // Reset the counter (for example)
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.primaryblue,
        drawer: const ApplicationDrawer(),
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!.meteoTitre,
        )),
        body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  SizedBox(
                      height: 360,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          (data != null)
                              ? Image.asset(data!.temp! > 18
                                  ? 'assets/images/sun.gif'
                                  : 'assets/images/cold.gif')
                              : SizedBox.fromSize(),
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  data != null
                      ? Text(
                          '${data!.temp}°',
                          style: const TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        )
                      : SizedBox.fromSize(),
                  const Divider(
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppLocalizations.of(context)!
                        .informationsSupplementairesTitre,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.ventsTites,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300),
                              ),
                              const Spacer(),
                              data != null
                                  ? Text('${data!.wind}')
                                  : SizedBox.fromSize(),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.humiditeTitre,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300),
                              ),
                              const Spacer(),
                              data != null
                                  ? Text('${data!.humidity}')
                                  : SizedBox.fromSize(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.pressionTitre,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300),
                              ),
                              const Spacer(),
                              data != null
                                  ? Text('${data!.pressure}')
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.descriptionTitre,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300),
                              ),
                              const Spacer(),
                              data != null
                                  ? Text('${data!.feelsLike}')
                                  : SizedBox.fromSize(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.gouvernoratTitre,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: InkWell(
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
                                    itemCount: gouvernorats.length,
                                    itemBuilder: (context, index) {
                                      return RadioListTile(
                                          title: Text(gouvernorats[index]),
                                          value: gouvernorats[index],
                                          groupValue: selectedOption,
                                          onChanged: (value) => setState(() {
                                                selectedOption = value!;
                                              }));
                                    },
                                  );
                                }),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(AppLocalizations.of(context)!
                                      .annulerTitre),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, selectedOption),
                                  child: Text(
                                      AppLocalizations.of(context)!.okTitre),
                                ),
                              ],
                            );
                          },
                        ).then((value) {
                          gouvernoratValue = value;
                          _reloadPage(value);
                        });
                      },
                      child: DropdownButton<String>(
                        isExpanded: true,
                        items: const [],
                        iconDisabledColor: Colors.black,
                        onChanged: (String? newValue) {},
                      ),
                    ),
                  )
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const LinearProgressIndicator();
            }
            return Container();
          },
        ));
  }
}
