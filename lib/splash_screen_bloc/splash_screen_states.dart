part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenState extends Equatable {
  const SplashScreenState._();

  @override
  List<Object?> get props => [];
}

@immutable
class InitialSplashScreenState extends SplashScreenState {
  const InitialSplashScreenState._() : super._();
}
@immutable
class LoginScreenState extends SplashScreenState {
  const LoginScreenState._() : super._();
}
