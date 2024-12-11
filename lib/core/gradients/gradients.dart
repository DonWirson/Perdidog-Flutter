import 'package:flutter/material.dart';

class Gradients {
  static LinearGradient loginGradient() {
    return LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: const [0.2, 0.5, 0.8, 0.7],
      colors: [
        Colors.blue[50]!,
        Colors.blue[100]!,
        Colors.blue[200]!,
        Colors.blue[300]!
      ],
    );
  }

  static LinearGradient registerGradient() {
    return LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: const [0.2, 0.5, 0.8, 0.7],
      colors: [
        Colors.blue[50]!,
        Colors.blue[100]!,
        Colors.blue[200]!,
        Colors.blue[300]!
      ],
    );
  }
}
