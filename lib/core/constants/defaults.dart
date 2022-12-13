import 'package:flutter/material.dart';

class Defaults {
  static const padding = 16.0;
  static const spacing = 12.0;
  static const radius = 8.0;
  static const baseUrl = '';

  static BorderRadius borderRadius = BorderRadius.circular(radius);

  static List<BoxShadow> boxShadow = [
    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
  ];
}
