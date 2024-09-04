import 'package:flutter/material.dart';
import 'package:flutter_theme/app.dart';
import 'package:flutter_theme/constant/shared_preferences.dart';
import 'package:flutter_theme/theme_color_repository/theme_color_repository.dart';
import 'package:flutter_theme/theme_data/theme_dark.dart';
import 'package:flutter_theme/theme_data/theme_light.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MainApp(), // MainAppを使用
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeColorRepositoryProvider);

    return MaterialApp(
      title: 'Theme Tips',
      theme: themeLight(),
      darkTheme: themeDark(),
      themeMode: themeMode,
      home: const MyApp(),
    );
  }
}
