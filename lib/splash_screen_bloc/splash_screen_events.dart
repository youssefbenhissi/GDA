part of 'splash_screen_bloc.dart';

abstract class SplashScreenEvent extends Equatable {
  const SplashScreenEvent._();

  @override
  List<Object?> get props => [];
}
@immutable
class InitialSplashScreenEvent extends SplashScreenEvent {
  const InitialSplashScreenEvent._() : super._();
}

@immutable
class LoginScreenEvent extends SplashScreenEvent {
  const LoginScreenEvent._() : super._();
}