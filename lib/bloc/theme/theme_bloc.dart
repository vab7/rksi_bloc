import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rksi_bloc/data/impl/database/database_impl.dart';
import 'package:rksi_bloc/resources/constants/constants.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeMode themeMode = ThemeMode.light;
  bool _theme = false;

  ThemeBloc() : super(ThemeLoading()) {
    on<SwitchDarkMode>(
      (event, emit) async {
        void setState() {
          themeMode = _theme ? ThemeMode.dark : ThemeMode.light;

          emit(ThemeLoading());

          emit(ChangeModeState());
        }

        if (event.isOn == null) {
          _theme = await _loadThemeMode();

          setState();
        } else {
          _theme = event.isOn!;

          _saveThemeMode();

          setState();
        }
      },
    );
  }

  Future<bool> _loadThemeMode() async {
    var theme = await DatabaseImpl<bool>().getData(
      boxName: themeBox,
      key: themeKey,
    ) as bool;

    return theme;
  }

  void _saveThemeMode() {
    DatabaseImpl<bool>()
        .saveData(boxName: themeBox, key: themeKey, value: _theme);
  }

  bool isDarkMode() => themeMode == ThemeMode.dark;
}
