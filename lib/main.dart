import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metronome Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 155, 155, 155)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Metronome Test'),
    );
  }
}

@override
class Metronome extends StatefulWidget {
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
      const Duration(seconds: 1),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Metronome(),
          ],
        ),
      ),
    );
  }
}
