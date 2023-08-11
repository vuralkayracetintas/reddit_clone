import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:reddit_clone/feature/home/home_view.dart';
import 'package:reddit_clone/product/constans/string_constans.dart';
import 'package:reddit_clone/product/repository/reddit_repository.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3000), () {});

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => RepositoryProvider(
                  create: (context) => RedditRepository(),
                  child: const HomeView(),
                )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Color.fromARGB(255, 101, 191, 107),
      Color.fromARGB(255, 255, 255, 255),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Color.fromARGB(255, 37, 34, 34)
          : const Color.fromARGB(255, 237, 237, 237),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              StringConstants.lottieSplash,
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
