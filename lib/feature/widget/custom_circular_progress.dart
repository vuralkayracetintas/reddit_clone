import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reddit_clone/product/constans/string_constans.dart';
import 'package:reddit_clone/product/model/drawer_model.dart';

class CustomCircleProgress extends StatelessWidget {
  const CustomCircleProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/animation/customCircle.json'),
    );
  }
}
