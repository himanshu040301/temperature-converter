import 'package:flutter/material.dart';
class Bgimage extends StatelessWidget {
  const Bgimage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/img.png",
      fit: BoxFit.cover,
    );
  }
}
