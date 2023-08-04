import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/app_page_injectable.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:pfe_iheb/weather_bloc/weather_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeatherPage extends StatefulWidget {
  final String location;
  const WeatherPage({Key? key, required this.location}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    List<String> gouvernorats = [
      AppLocalizations.of(context)!.tunisTitre,
      AppLocalizations.of(context)!.arianaTitre,
      AppLocalizations.of(context)!.benArousTitre,
      AppLocalizations.of(context)!.manoubaTitre,
      AppLocalizations.of(context)!.nabeulTitre,
      AppLocalizations.of(context)!.bejaTitre,
      AppLocalizations.of(context)!.jendoubaTitre,
      AppLocalizations.of(context)!.kefTitre,
      AppLocalizations.of(context)!.silianaTitre,
      AppLocalizations.of(context)!.sousseTitre,
      AppLocalizations.of(context)!.monastirTitre,
      AppLocalizations.of(context)!.mehdiaTitre,
      AppLocalizations.of(context)!.sfaxTitre,
      AppLocalizations.of(context)!.kairouanTitre,
      AppLocalizations.of(context)!.kasserineTitre,
      AppLocalizations.of(context)!.sidibouzidTitre,
      AppLocalizations.of(context)!.gabesTitre,
      AppLocalizations.of(context)!.medenineTitre,
      AppLocalizations.of(context)!.tataouineTitre,
      AppLocalizations.of(context)!.gafsaTitre,
      AppLocalizations.of(context)!.tozeurTitre,
      AppLocalizations.of(context)!.kebeliTitre,
    ];

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
      body: BlocBuilder<WeatherBloc, WeatherState>(
        buildWhen: (prev, next) => prev != next,
        builder: (context, state) {
          if (state is LoadedWeatherState) {
            return Column(
              children: [
                SizedBox(
                    height: 360,
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        (state.model != null)
                            ? Image.asset(state.model!.temp! > 18
                                ? 'assets/images/sun.gif'
                                : 'assets/images/cold.gif')
                            : SizedBox.fromSize(),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${state.model!.temp}°',
                  style: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold),
                ),
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.w300),
                            ),
                            const Spacer(),
                            state.model != null
                                ? Text('${state.model!.wind}')
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.w300),
                            ),
                            const Spacer(),
                            state.model != null
                                ? Text('${state.model!.humidity}')
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.w300),
                            ),
                            const Spacer(),
                            state.model != null
                                ? Text('${state.model!.pressure}')
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.w300),
                            ),
                            const Spacer(),
                            state.model != null
                                ? Text('${state.model!.feelsLike}')
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
                  child: StatefulBuilder(
                    builder: (context, setState) => DropdownButton<String>(
                      isExpanded: true,
                      value: widget.location,
                      items: gouvernorats
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
                          context.gNavigationService
                              .openWeatherScreen(context, newValue!);
                        });
                      },
                    ),
                  ),
                )
              ],
            );
          } else if (state is LoadingWeatherState ||
              state is InitialWeatherState) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        },
      ),
    );
  }
}
