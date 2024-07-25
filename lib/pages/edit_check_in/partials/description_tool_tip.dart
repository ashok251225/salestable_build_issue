import 'package:flutter/material.dart';

class DescriptionToolTip extends StatefulWidget {
  const DescriptionToolTip(
      {super.key, required this.child, required this.description});
  final String description;
  final Widget child;

  @override
  State<DescriptionToolTip> createState() => _DescriptionToolTipState();
}

class _DescriptionToolTipState extends State<DescriptionToolTip> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.description,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
            colors: <Color>[Color(0xFF0494FD), Color(0xFF0B55DA)]),
      ),
      height: 20,
      margin:EdgeInsets.fromLTRB(5,0,5,0),
      padding: const EdgeInsets.all(12.0),
      preferBelow: false,
      textStyle: const TextStyle(fontSize: 14, color: Colors.white),
      showDuration: const Duration(seconds: 4),
      waitDuration: const Duration(seconds: 0),
      child: widget.child,
    );
  }
}
