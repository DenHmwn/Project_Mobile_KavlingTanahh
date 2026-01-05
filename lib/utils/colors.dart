import 'package:flutter/material.dart';

class AppColors {
  static const Color darkBlue = Color(0xFF1A2332);
  static const Color lightBlue = Color(0xFF2B3A4F);
  static const Color yellow = Color(0xFFFFE194);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF9CA3AF);
  static const Color lightGrey = Color(0xFFF3F4F6);
  static const Color red = Color(0xFFEF4444);
  static const Color orange = Color(0xFFFF8C00);

  // Gradient colors
  static const LinearGradient sunsetGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFF8C69), Color(0xFFFFE194), Color(0xFF87CEEB)],
  );
}
