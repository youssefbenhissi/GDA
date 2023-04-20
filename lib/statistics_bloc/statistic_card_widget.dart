import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  final String date;
  final String tauxDePerteTitre;
  final double tauxDePerteValeur;
  final String consommationSpecifiqueTitre;
  final double consommationSpecifiqueValeur;
  final String consommationSpecifiqueEauDeJavelTitre;
  final double consommationSpecifiqueEauDeJavelValeur;
  final String recetteMoyenneTitre;
  final double recetteMoyenneValeur;
  const StatisticsCard({
    super.key,
    required this.date,
    required this.tauxDePerteTitre,
    required this.tauxDePerteValeur,
    required this.consommationSpecifiqueTitre,
    required this.consommationSpecifiqueValeur,
    required this.consommationSpecifiqueEauDeJavelTitre,
    required this.consommationSpecifiqueEauDeJavelValeur,
    required this.recetteMoyenneTitre,
    required this.recetteMoyenneValeur,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Text(date),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tauxDePerteTitre),
                  Container(
                    alignment: Alignment.centerRight,
                    width: 50,
                    color: tauxDePerteValeur > 25
                        ? Colors.red
                        : consommationSpecifiqueValeur > 15
                            ? Colors.orange
                            : Colors.green,
                    child: Text(
                      tauxDePerteValeur.toString(),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(consommationSpecifiqueTitre),
                  Container(
                    alignment: Alignment.centerRight,
                    width: 50,
                    color: consommationSpecifiqueValeur > 100
                        ? Colors.red
                        : consommationSpecifiqueValeur > 75
                            ? Colors.green
                            : consommationSpecifiqueValeur > 50
                                ? Colors.orange
                                : const Color.fromARGB(255, 245, 125, 125),
                    child: Text(
                      consommationSpecifiqueValeur.toString(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(consommationSpecifiqueEauDeJavelTitre),
                  Container(
                    alignment: Alignment.centerRight,
                    width: 50,
                    color: consommationSpecifiqueEauDeJavelValeur >= 0.025
                        ? Colors.green
                        : Colors.red,
                    child: Text(
                      consommationSpecifiqueEauDeJavelValeur.toString(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(recetteMoyenneTitre),
                  Text(recetteMoyenneValeur.toString()),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
