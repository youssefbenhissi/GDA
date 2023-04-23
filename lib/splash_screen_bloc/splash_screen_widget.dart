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
            textAlign: TextAlign.center,
          ),
          const Text(
            'DES RESSOURCES HYDRAULIQUES ET DE LA PECHE MARITIME',
            textAlign: TextAlign.center,
          ),
          const Text(
            'Système d\'Information pour le suivi et l\'évaluation de\nl\'expolitation et de la gestion des Systèmes\nd\'Alimentation de l\'Eau Potable (SAEP) en milieu rural',
            textAlign: TextAlign.center,
          ),
          const Text(
            'منظومة التصرف في شبكات الماء الصالح للشرب \nلدى مجامع التنمية الفلاحية',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
