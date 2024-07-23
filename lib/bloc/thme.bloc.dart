import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../themes/themes.dart';

abstract class ThemeEvent {}

class SwitchThemeEvent extends ThemeEvent {}

abstract class ThemeState {
  final ThemeData theme;
  ThemeState({required this.theme});
}

class SuccesThemeState extends ThemeState {
  SuccesThemeState({required super.theme});
}

class InitialThemeState extends ThemeState {
  InitialThemeState() : super(theme: CutemTheme.themes[0]);
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  int currnetThemeIndex = 0;
  List<ThemeData> themes = CutemTheme.themes;
  ThemeBloc() : super(InitialThemeState()) {
    on((SwitchThemeEvent event, emit) {
      ++currnetThemeIndex;
      if (currnetThemeIndex >= themes.length) {
        currnetThemeIndex = 0;
      }
      emit(SuccesThemeState(theme: themes[currnetThemeIndex]));
    });
  }
}
