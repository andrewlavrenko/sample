import 'package:flutter/material.dart';

class SampleController extends ChangeNotifier {
  String? _sample;

  String? get sample => _sample;

  void changeSample(String? sample) {
    _sample = sample;
    notifyListeners();
  }
}
