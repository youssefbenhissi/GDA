import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'splash_screen_events.dart';
part 'splash_screen_states.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(const InitialSplashScreenState._()) {
    on<InitialSplashScreenEvent>(_showSplashScreen);
    on<LoginScreenEvent>(
      (event, emitter) => emitter(
        const LoginScreenState._(),
      ),
    );
  }

  Future<void> _showSplashScreen(
    InitialSplashScreenEvent event,
    Emitter<SplashScreenState> emitter,
  ) async {
    await Future.delayed(const Duration(seconds: 3));
    emitter(const LoginScreenState._());
  }

  void showSplashScreen() {
    add(const InitialSplashScreenEvent._());
  }
}
