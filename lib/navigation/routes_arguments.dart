part of 'navigation.dart';

class _DetailsArguments {
  final FicheGDAModel modele;
  _DetailsArguments(this.modele);
}

class _SpecificIndicateurArguments {
  final int month;
  final int year;
  _SpecificIndicateurArguments(this.month, this.year);
}

class _SpecificFicheGDAArguments {
  final int month;
  final int year;
  final int gda;
  _SpecificFicheGDAArguments(this.month, this.year, this.gda);
}

class _SpecificDonneesTechniques {
  final SpecificFicheGDAModel specificFicheGDAModel;
  _SpecificDonneesTechniques(this.specificFicheGDAModel);
}
