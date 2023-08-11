import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/feature/home/home_view.dart';
import 'package:reddit_clone/product/constans/string_constans.dart';
import 'package:reddit_clone/product/repository/reddit_repository.dart';

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
      home: RepositoryProvider(
        create: (context) => RedditRepository(),
        child: const HomeView(),
      ),
    );
  }
}
