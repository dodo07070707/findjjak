import 'package:flutter/material.dart';
import 'package:findjjak/theme/color_theme.dart';

abstract class FindjjakTextTheme {
  static final Main = TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 64,
    color: Colors.white,
    letterSpacing: 2,
    shadows: [
      Shadow(
        blurRadius: 10,
        color: Colors.white.withOpacity(0.7),
        offset: const Offset(0, 0),
      ),
    ],
  );
}
