import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:async';
import './providers.dart';

@override
class Metronome extends ConsumerStatefulWidget {
  const Metronome({super.key});

  @override
  MetronomeState createState() => MetronomeState();
}

class MetronomeState extends ConsumerState<Metronome> {
  var metro = Metro();
  // 初期化
  @override
  void initState() {
    super.initState();
  }

  // 破棄された時の処理
  @override
  void dispose() {
    metro.cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isRunning = ref.watch(isRunningProvider);
    final bpm = ref.watch(beatsProvider).bpm;
    if (isRunning) {
      metro.startTimer(bpm);
      return const Text('STOP');
    } else {
      metro.cancelTimer();
      return const Text('START');
    }
  }
}

class Metro {
  final player = AudioPlayer();
  Timer? timer;

  // Timer開始
  Future<void> startTimer(int bpm) async {
    try {
      await player.setAsset('assets/click.mp3');
    } catch (e) {
      print("An error occurred: ${e.toString()}");
    }
    // int型にするしかないけど精度怪しくなりそう
    int period = 60 * 1000 * 1000 ~/ bpm;
    timer = Timer.periodic(
      Duration(microseconds: period),
      _onTimer,
    );
  }

  // Timer停止
  void cancelTimer() {
    if (timer != null) {
      timer!.cancel();
      timer = null;
    }
  }

  // Timerから呼び出す処理
  void _onTimer(Timer timer) {
    Timer.run(() => player.play());
    Timer.run(() => player.seek(const Duration(seconds: 0)));
  }
}
