import 'package:flutter/material.dart';

@immutable
class BeatsData {
  static const int minbpm = 10;
  static const int maxbpm = 300;
  final int bpm;

  const BeatsData({required this.bpm});
}
