//pravim novi widget, kapiram da ću moći više putada ga koristim

import 'package:flutter/material.dart';

//fun fact: u cant spell button without butt
class AppCircButton extends StatelessWidget {
  const AppCircButton(
      {super.key,
      required this.child,
      this.color,
      required this.width,
      this.onTap});

  final Widget child;
  final Color? color;
  final double width;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        child: child, //prosledš šta e child npr ikonica
      ),
    );
  }
}
