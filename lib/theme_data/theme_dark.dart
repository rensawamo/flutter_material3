import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeDark() {
  const primary = Colors.green;
  const onPrimary = Colors.grey;
  const secoundary = Colors.blue;

  // テーマの基本設定
  final base = ThemeData(
    /// アプリのフォントを指定
    fontFamily: GoogleFonts.kiwiMaru().fontFamily,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      // ライトテーマの指定
      brightness: Brightness.dark,
      //   必須プロパティ
      //  この色を元にして他の色が生成される
      seedColor: primary,
      // プライマリカラー(一番よく使う色)
      // swich on時の色
      //ex) style: TextStyle(color: theme.colorScheme.primary)),
      primary: primary,
      // アクセントカラー
      secondary: secoundary,
      // errorの色
      // ex) TextFieldのエラーメッセージ
      error: Colors.red,
      // appbar 背景色
      surface: Colors.blue,
      // card 背景色
      surfaceContainerLow: Colors.pink,
      // OutlinedButtonの枠線の色や、エラーなし時のTextFieldの枠線の色、Switchの枠線の色
      outline: Colors.orangeAccent,
      // etc 要件に応じて追加可能
    ),
    textTheme: const TextTheme(
      // Text("") のデフォルトスタイルを指定。
      // titleなど他にもデフォルトの設定をここで適応可能。
          bodyMedium: TextStyle(fontSize: 22, color: Colors.cyan),

      // fontWeight: FontWeight.bold,
      // height: 1.5,
    ),
  );

  // テーマのカスタマイズ
  // 特定のウィジェットに適応されるテーマを設定する
  return base.copyWith(
    // ElevatedButtonのテーマを設定する例
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: onPrimary,
      ),
    ),

    // floatingActionButtonのテーマを設定する例
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
    ),
    // etc 要件に応じて追加可能

    // https://qiita.com/najeira/items/dfa20d0104bd4457bc9a
    // ios風の遷移アニメーションを設定
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
