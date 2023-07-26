part of 'specific_depenses_bloc.dart';

abstract class SpecificDepensesEvent extends Equatable {
  const SpecificDepensesEvent._();
  @override
  List<Object?> get props => [];
}

@immutable
class LoadSpecificDepensesFuncEvent extends SpecificDepensesEvent {
  final String gda;
  final int month;
  final int year;
  const LoadSpecificDepensesFuncEvent._(
    this.gda,
    this.month,
    this.year,
  ) : super._();
  @override
  List<Object?> get props => [gda, month, year];
}
