import 'package:flutter/material.dart';

class ScreenConfig {
  static Size getDesignSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1200) return const Size(1440, 1024); // desktop
    if (width >= 600) return const Size(800, 1280);   // tablet
    return const Size(375, 812);                      // mobile
  }
}
