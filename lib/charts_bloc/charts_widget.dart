import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pfe_iheb/statistics_bloc/statistics_bloc.dart';
import 'package:pfe_iheb/utils/app_colors.dart';
import 'package:pfe_iheb/utils/drawer.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartsWidget extends StatelessWidget {
  static List<charts.Series<Sales, String>> _createRandomData(
    BuildContext context,
    List<Sales> listTauxDePerte,
    List<Sales> listConsommationSpecifique,
  ) {
    

    return [
      charts.Series<Sales, String>(
        id: AppLocalizations.of(context)!.tauxDePerteTitre,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: listTauxDePerte,
      ),
      charts.Series<Sales, String>(
        id: AppLocalizations.of(context)!.consommationSpeTitre,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: listConsommationSpecifique,
      ),
    ];
  }

  const ChartsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryblue,
      drawer: const ApplicationDrawer(),
      appBar: AppBar(
          title: Text(
        AppLocalizations.of(context)!.chartsTitre,
      )),
      body: BlocBuilder<StatisticsBloc, StatisticsState>(
        buildWhen: (prev, next) => prev.runtimeType != next.runtimeType,
        builder: (context, state) {
          if (state is LoadedStatiticsState) {
            List<Sales> listTauxDePerte = [];
            List<Sales> tabletSalesData = [];
            for (int i = 0; i < state.models.length; i++) {
              Sales s = Sales(state.models.keys.elementAt(i),
                  state.models[state.models.keys.elementAt(i)]![0]);
              listTauxDePerte.add(s);
              s = Sales(state.models.keys.elementAt(i),
                  state.models[state.models.keys.elementAt(i)]![1]);
              tabletSalesData.add(s);
            }
            List<charts.Series<dynamic, String>> seriesList = _createRandomData(context , listTauxDePerte,tabletSalesData);
            return charts.BarChart(
              seriesList,
              animate: true,
              vertical: false,
              behaviors: [charts.SeriesLegend()],
              barGroupingType: charts.BarGroupingType.grouped,
              defaultRenderer: charts.BarRendererConfig(
                groupingType: charts.BarGroupingType.grouped,
                strokeWidthPx: 1.0,
              ),
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

class Sales {
  final String year;
  final double sales;

  Sales(this.year, this.sales);
}
