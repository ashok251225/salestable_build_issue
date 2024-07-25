import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAll extends StatelessWidget {
  LoadingAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 65.0),
      child: Center(
        child: Lottie.asset('assets/lottie_animations/Salestable_Loading.json',
            width: 120, height: 120),
      ),
    );
  }
}
