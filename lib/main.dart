import 'package:flutter/material.dart';
import 'package:reddit_clone/feature/pages/slash_page.dart';
import 'package:reddit_clone/product/constans/string_constans.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstants.appTitle,
      themeMode: ThemeMode.system,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
