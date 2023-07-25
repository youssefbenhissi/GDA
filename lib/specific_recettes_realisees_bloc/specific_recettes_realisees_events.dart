part of 'specific_recettes_realisees_bloc.dart';

abstract class SpecificRecettesRealiseesEvent extends Equatable {
  const SpecificRecettesRealiseesEvent._();
  @override
  List<Object?> get props => [];
}

@immutable
class LoadSpecificRecettesRealiseesFuncEvent
    extends SpecificRecettesRealiseesEvent {
  final String gda;
  final int month;
  final int year;
  const LoadSpecificRecettesRealiseesFuncEvent._(
    this.gda,
    this.month,
    this.year,
  ) : super._();
  @override
  List<Object?> get props => [gda, month, year];
}
