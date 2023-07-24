part of 'specific_donnees_techniques_bloc.dart';

abstract class SpecificDonneesTechniquesEvent extends Equatable {
  const SpecificDonneesTechniquesEvent._();
  @override
  List<Object?> get props => [];
}

@immutable
class LoadSpecificDonneesTechniquesFuncEvent
    extends SpecificDonneesTechniquesEvent {
  final String gda;
  final int month;
  final int year;
  const LoadSpecificDonneesTechniquesFuncEvent._(
    this.gda,
    this.month,
    this.year,
  ) : super._();
  @override
  List<Object?> get props => [gda, month, year];
}
