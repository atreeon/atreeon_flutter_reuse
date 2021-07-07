//MenuItem("Demo_ReusableTable", () => Demo_ReusableTable()),
//MenuItem("Demo_ShrinkingTextInputW", () => Demo_ShrinkingTextInputW()),

import 'package:adi_menu_flutter/menuItem.dart';
import 'package:adi_menu_flutter/menuSand.dart';
import 'package:example/Demo_OptionalParentW.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      );
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return SafeArea(
      child: MenuSand("Reuse Widgets", [
        MenuSubMenu("Datagrid Demos", [
          MenuItem("Demo_OptionalParentW", () => Demo_OptionalParentW()),
        ]),
      ]),
    );
  }
}
