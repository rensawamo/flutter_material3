import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_theme/home.dart';
import 'package:flutter_theme/theme_color_repository/theme_color_repository.dart';
import 'package:flutter_theme/theme_data/theme_dark.dart';
import 'package:flutter_theme/theme_data/theme_light.dart';



class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeColorRepositoryProvider);

    return MaterialApp(
      title: 'Theme Tips',
      theme: themeLight(),
      darkTheme: themeDark(),
      themeMode: themeMode,
      home: const Home(),
    );
  }
}

