import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  final bool loading;
  final Widget child;
  const Loading({super.key, this.loading = false, required this.child});

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Padding(
        padding: const EdgeInsets.only(top: 150.0),
        child: Center(
          child: Lottie.asset(
              'assets/lottie_animations/Salestable_Loading.json',
              width: 150,
              height: 150),
        ),
      );
    }
    return child;
  }
}
