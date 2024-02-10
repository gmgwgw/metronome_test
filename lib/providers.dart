import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metronome_test/models.dart';
import 'notifiers.dart';

final beatsProvider =
    StateNotifierProvider<BeatsNotifier, BeatsData>((ref) => BeatsNotifier());

final isRunningProvider =
    NotifierProvider<IsRunningNotifier, bool>(IsRunningNotifier.new);
