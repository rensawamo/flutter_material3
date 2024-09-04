import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeLight() {
  const primary = Color.fromARGB(255, 37, 83, 38);

  // テーマの基本設定
  // https://zenn.dev/gen_kk/articles/cc538ffa392922
  final base = ThemeData(
    /// アプリのフォントを指定
    fontFamily: GoogleFonts.kiwiMaru().fontFamily,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      // ライトテーマの指定
      brightness: Brightness.light,
      //   必須プロパティ
      //  この色を元にして他の色が生成される
      seedColor: primary,
      // プライマリカラー(一番よく使う色)
      // デフォルトのテキストカラーが primaryで設定されているケースなど
      // 今回はOutlinedButtonの textの色
      primary: primary,
      // errorの色
      // ex) TextFieldのエラーメッセージ
      error: Colors.red,
      // appbar 背景色
      surface: Colors.green,
      // card 背景色
      surfaceContainerLow: Colors.amberAccent,
      // dialog
      surfaceContainerHigh: Colors.pink,

      // OutlinedButtonの枠線の色や、エラーなし時のTextFieldの枠線の色、Switchの枠線の色
      outline: Colors.orangeAccent,
      // etc 要件に応じて追加可能
    ),
    textTheme: const TextTheme(
      // https://flutter.salon/widget/textstyle/
      // 一環したテキストスタイルを定義す

      /// Middle size of the body styles.
      ///
      /// Body styles are used for longer passages of text.
      ///
      /// The default text style for [Material].
      // final TextStyle? bodyMedium;

      bodyMedium: TextStyle(fontSize: 18, color: Colors.black),
      headlineMedium: TextStyle(fontSize: 24, color: Colors.blue),
      labelSmall: TextStyle(fontSize: 14, color: Colors.grey),
    ),
  );

  // テーマのカスタマイズ
  // 特定のウィジェットに適応されるテーマを設定する
  return base.copyWith(
    // ElevatedButtonのテーマを設定する例
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
      ),
    ),

    // floatingActionButtonのテーマを設定する例
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),

    // dialog
    // dialogTheme: DialogTheme(
    //   backgroundColor: Colors.pink,
    //   titleTextStyle: TextStyle(
    //     color: Colors.black,
    //     fontSize: 24,
    //   ),
    //   contentTextStyle: TextStyle(
    //     color: Colors.black,
    //     fontSize: 18,
    //   ),
    // ),

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


