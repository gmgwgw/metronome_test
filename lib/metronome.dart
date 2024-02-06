import 'package:flutter/material.dart';
import 'dart:async';

@override
class Metronome extends StatefulWidget {
  const Metronome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MetronomeState();
  }
}

class _MetronomeState extends State<Metronome> {
  int _time = 1;

  @override
  void initState() {
    Timer.periodic(
      const Duration(milliseconds: 666),
      _onTimer,
    );
    super.initState();
  }

  void _onTimer(Timer timer) {
    int nextTime;
    if (_time >= 4) {
      nextTime = 1;
    } else {
      nextTime = _time + 1;
    }
    setState(() => _time = nextTime);
  }

  @override
  Widget build(BuildContext context) {
    return Text('$_time');
  }
}
