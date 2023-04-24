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