import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../metronome.dart';
import '../providers.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isRunningNotifier = ref.watch(isRunningProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Metronome(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () => _isRunningNotifier.invert(),
              child: const Text('Button'),
            ),
          ],
        ),
      ),
    );
  }
}
