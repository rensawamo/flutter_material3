import 'package:flutter/material.dart';
import 'package:flutter_theme/constant/app_prefs_key.dart';
import 'package:flutter_theme/constant/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'theme_color_repository.g.dart';

@riverpod
class ThemeColorRepository extends _$ThemeColorRepository {
  final AppPrefsKey _themeKey = AppPrefsKey.configModeType;

  @override
  ThemeMode build() {
    final result =
        ref.watch(sharedPreferencesProvider).getString(_themeKey.value);
    if (result == null) {
      return ThemeMode.light;
    }
    return ThemeMode.values.byName(result);
  }

  void setState(ThemeMode themeMode) {
    state = themeMode;
    ref
        .read(sharedPreferencesProvider)
        .setString(_themeKey.value, themeMode.name);
  }
}