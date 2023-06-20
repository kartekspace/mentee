import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tek_capsule/core/themes/styles.dart';


class ThemeCubit extends Cubit<ThemeData> {
  final bool? isDark;

  ThemeCubit(this.isDark)
      : super(isDark == null
            ? appTheme
            : isDark
                ? darkTheme
                : appTheme);

  void selectLightTheme() {
    emit(appTheme);
  }

  void selectDarkTheme() {
    emit(darkTheme);
  }
}
