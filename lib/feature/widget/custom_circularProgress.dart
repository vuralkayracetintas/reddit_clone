import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomCircleProgress extends StatelessWidget {
  const CustomCircleProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/animation/customCircle.json'),
    );
  }
}
