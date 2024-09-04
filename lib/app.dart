import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_theme/widget/setting_switch_tile.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Theme Tips",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        // スクロール可能にするために SingleChildScrollView で包む
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Theme Tips"),

                /// 以下は、app.dart で設定したテーマが適応される例
                ///
                /// error が適応される例
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Error 有り",
                    hintText: "Input something",
                    errorText: "Error Message",
                  ),
                ),
                const SizedBox(height: 16),

                /// surface が適応される例
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: const Text("Card Surface Color"),
                  ),
                ),
                const SizedBox(height: 16),

                /// outline が適応される例
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("Outline で枠線を指定している例"),
                ),

                const SizedBox(height: 16),

                // elevatedButtonの設定が適応される例
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("ElevatedButton"),
                ),

                // themeの切り替え
                const SettingsSwitchTile(
                  title: "theme切替え",
                  icon: Icons.brightness_4,
                ),
              ],
            ),
          ),
        ),
      ),

      // FloatingActionButtonの設定が適応される例
      floatingActionButton: FloatingActionButton(
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
