part of 'consultation_screen_bloc.dart';

abstract class ConsultationScreenEvent extends Equatable {
  const ConsultationScreenEvent._();

  @override
  List<Object?> get props => [];
}

@immutable
class MonthAndYearFieldsEvent extends ConsultationScreenEvent {
  final String month;
  final String year;
  const MonthAndYearFieldsEvent._(this.month, this.year) : super._();
  @override
  List<Object?> get props => [month, year];
}

@immutable
class AllFieldsEvent extends ConsultationScreenEvent {
  final String month;
  final String year;
  final String gda;
  const AllFieldsEvent._(this.month, this.year, this.gda) : super._();
  @override
  List<Object?> get props => [month, year, gda];
}
