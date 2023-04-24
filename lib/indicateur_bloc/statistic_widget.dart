import 'package:flutter/material.dart';

class ConsultationStatisticsCard extends StatelessWidget {
  final String tauxDePerteTitre;
  final double tauxDePerteValeur;
  final String tauxDeRecouvrementTitre;
  final double tauxDeRecouvrementValeur;
  final String consommationSpecifiqueTitre;
  final double consommationSpecifiqueValeur;
  final String consommationSpecifiqueEauDeJavelTitre;
  final double consommationSpecifiqueEauDeJavelValeur;
  final String recetteMoyenneTitre;
  final double recetteMoyenneValeur;
  final String nombreDeJourArretTitre;
  final double nombreDeJourArretValeur;
  const ConsultationStatisticsCard({
    super.key,
    required this.tauxDePerteTitre,
    required this.tauxDePerteValeur,
    required this.tauxDeRecouvrementTitre,
    required this.tauxDeRecouvrementValeur,
    required this.consommationSpecifiqueTitre,
    required this.consommationSpecifiqueValeur,
    required this.consommationSpecifiqueEauDeJavelTitre,
    required this.consommationSpecifiqueEauDeJavelValeur,
    required this.recetteMoyenneTitre,
    required this.recetteMoyenneValeur,
    required this.nombreDeJourArretTitre,
    required this.nombreDeJourArretValeur,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tauxDeRecouvrementTitre),
                Container(
                  alignment: Alignment.centerRight,
                  width: 50,
                  color: tauxDeRecouvrementValeur > 75
                      ? Colors.green
                      : consommationSpecifiqueValeur > 60
                          ? Colors.orange
                          : Colors.red,
                  child: Text(
                    tauxDeRecouvrementValeur.toString(),
                  ),
                )
              ],
            ),
            const Divider(),
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
            const Divider(),
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
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(recetteMoyenneTitre),
                Text(
                  recetteMoyenneValeur.toString(),
                  style: const TextStyle(color: Colors.lightBlue),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(nombreDeJourArretTitre),
                Text(
                  nombreDeJourArretValeur.toString(),
                  style: const TextStyle(color: Colors.lightBlue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
