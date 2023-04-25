part of 'consultation_screen_bloc.dart';

@immutable
abstract class ConsultationScreenState extends Equatable {
  const ConsultationScreenState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialConsultationScreenState extends ConsultationScreenState {
  const InitialConsultationScreenState._() : super._();
}

@immutable
class MonthAndYearChosenState extends ConsultationScreenState {
  const MonthAndYearChosenState._() : super._();
}

@immutable
class AllFieldsChosenState extends ConsultationScreenState {
  const AllFieldsChosenState._() : super._();
}
