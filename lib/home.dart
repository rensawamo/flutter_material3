import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_theme/widget/setting_switch_tile.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Tips",
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        // スクロール可能にするために SingleChildScrollView で包む
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // themeの切り替え
                const SettingsSwitchTile(
                  title: "theme切替え",
                ),
                Text("・seedColorによる自動生成色が適応される例",
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(height: 16),
                Text("secoundary",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary)),
                Text("tertiary",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary)),

                Text("onSurface",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface)),
                Text("errorContainer",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.errorContainer)),

                SizedBox(height: 16),

                Text("・ColorSchemeのカスタマイズが適応される例",
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Error 色を青にカスタマイズ",
                    hintText: "Input something",
                    errorText: "Error Message",
                  ),
                ),
                const SizedBox(height: 16),

                const Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: const Text("surfaceContainerLowをオレンジにカスタマイズ"),
                  ),
                ),

                SizedBox(height: 16),

                /// 以下は、app.dart で設定したテーマが適応される例
                ///
                /// error が適応される例
                Text("・ウィジェットのカスタマイズが適応される例",
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(height: 16),

                const SizedBox(height: 16),

                // elevatedButtonの設定が適応される例
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("ElevatedButtonカスタマイズ"),
                ),

                // FloatingActionButtonの設定が適応される例
                FloatingActionButton(
                  onPressed: () {
                    // ボタンが押されたときにダイアログを表示する
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Dialog Title"),
                          content: const Text("This is a simple dialog."),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop(); // ダイアログを閉じる
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  // floatingActionButtonの設定が適応される例
                  child: Text("FAB"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
