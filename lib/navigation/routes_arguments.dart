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
  final String gda;
  _SpecificFicheGDAArguments(this.month, this.year, this.gda);
}

class _SpecificDonneesTechniquesArguments {
  final String gda;
  final int month;
  final int year;
  _SpecificDonneesTechniquesArguments(this.gda, this.month, this.year);
}

class _SpecificRecettesRealiseesArguments {
  final String gda;
  final int month;
  final int year;
  _SpecificRecettesRealiseesArguments(this.gda, this.month, this.year);
}

class _SpecificDepensesArguments {
  final SpecificFicheGDAModel specificFicheGDAModel;
  _SpecificDepensesArguments(this.specificFicheGDAModel);
}

class _WeatherArguments {
  final String location;
  _WeatherArguments(this.location);
}
