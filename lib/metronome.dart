import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
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
  final _player = AudioPlayer();

  @override
  void initState() {
    Timer.periodic(
      const Duration(milliseconds: 300),
      _onTimer,
    );
    _init();
    super.initState();
  }

  Future<void> _init() async {
    try {
      await _player.setAsset('assets/click.mp3');
    } catch (e) {
      // エラー処理
      print("An error occurred: ${e.toString()}");
    }
  }

  void _onTimer(Timer timer) {
    int nextTime;
    if (_time >= 4) {
      nextTime = 1;
    } else {
      nextTime = _time + 1;
    }
    Timer.run(() => _player.play());
    Timer.run(() => _player.seek(const Duration(seconds: 0)));
    setState(() => _time = nextTime);
  }

  @override
  Widget build(BuildContext context) {
    return Text('$_time');
  }
}
