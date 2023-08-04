import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_iheb/weather_bloc/weather_bloc.dart';
import 'package:pfe_iheb/weather_bloc/weather_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeatherScreenRouteBuilder {
  String location;
  WeatherScreenRouteBuilder({required this.location});

  Widget call(BuildContext context) {
    String finallocation = "";
    if (location == AppLocalizations.of(context)!.tunisTitre) {
      finallocation = "TUNIS";
    } else if (location == AppLocalizations.of(context)!.arianaTitre) {
      finallocation = "ARIANA";
    } else if (location == AppLocalizations.of(context)!.benArousTitre) {
      finallocation = "BEN AROUS";
    } else if (location == AppLocalizations.of(context)!.manoubaTitre) {
      finallocation = "MANOUBA";
    } else if (location == AppLocalizations.of(context)!.nabeulTitre) {
      finallocation = "NABEUL";
    } else if (location == AppLocalizations.of(context)!.bejaTitre) {
      finallocation = "BEJA";
    } else if (location == AppLocalizations.of(context)!.jendoubaTitre) {
      finallocation = "JENDOUBA";
    } else if (location == AppLocalizations.of(context)!.kefTitre) {
      finallocation = "KEF";
    } else if (location == AppLocalizations.of(context)!.silianaTitre) {
      finallocation = "SILIANA";
    } else if (location == AppLocalizations.of(context)!.sousseTitre) {
      finallocation = "SOUSSE";
    } else if (location == AppLocalizations.of(context)!.monastirTitre) {
      finallocation = "MONASTIR";
    } else if (location == AppLocalizations.of(context)!.mehdiaTitre) {
      finallocation = "MEHDIA";
    } else if (location == AppLocalizations.of(context)!.sfaxTitre) {
      finallocation = "SFAX";
    } else if (location == AppLocalizations.of(context)!.kairouanTitre) {
      finallocation = "KAIROUAN";
    } else if (location == AppLocalizations.of(context)!.kasserineTitre) {
      finallocation = "KASSERINE";
    } else if (location == AppLocalizations.of(context)!.sidibouzidTitre) {
      finallocation = "SIDI BOUZID";
    } else if (location == AppLocalizations.of(context)!.gabesTitre) {
      finallocation = "GABES";
    } else if (location == AppLocalizations.of(context)!.medenineTitre) {
      finallocation = "MEDENINE";
    } else if (location == AppLocalizations.of(context)!.tataouineTitre) {
      finallocation = "TATAOUINE";
    } else if (location == AppLocalizations.of(context)!.gafsaTitre) {
      finallocation = "GAFSA";
    } else if (location == AppLocalizations.of(context)!.tozeurTitre) {
      finallocation = "TOZEUR";
    } else if (location == AppLocalizations.of(context)!.kebeliTitre) {
      finallocation = "KEBELI";
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WeatherBloc()..loadWeather(finallocation),
        ),
      ],
      child: WeatherPage(location: location),
    );
  }
}
