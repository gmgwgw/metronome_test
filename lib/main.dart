import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './views/home.dart';

void main() {
  runApp(
    //下位ツリーのWidgetでProviderを呼び出せるようにする
    const ProviderScope(
      child: MyApp(),
    ),
  );
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
