import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/Logo.jpg',
            fit: BoxFit.cover,
          ),
          const Text(
            'MINISTRE DE L\'AGRICULTURE',
            style: TextStyle(fontSize: 25.0),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'DES RESSOURCES HYDRAULIQUES ET DE LA PECHE MARITIME',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.0,),
            
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Système d\'Information pour le suivi et l\'évaluation de\nl\'expolitation et de la gestion des Systèmes\nd\'Alimentation de l\'Eau Potable (SAEP) en milieu rural',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'منظومة التصرف في شبكات الماء الصالح للشرب \nلدى مجامع التنمية الفلاحية',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
