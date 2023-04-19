import 'package:flutter/material.dart';
import 'package:pfe_iheb/utils/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const ApplicationDrawer(),
    );
  }
}
