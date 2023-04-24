part of 'consultation_bloc.dart';

@immutable
abstract class ConsultationState extends Equatable {
  const ConsultationState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialConsultationState extends ConsultationState {
  const InitialConsultationState._() : super._();
}
