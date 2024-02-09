import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/beats_data.dart';

class BeatsNotifier extends StateNotifier<BeatsData> {
  BeatsNotifier() : super(const BeatsData(bpm: 120));

  void changeBpm(int num) {
    int newbpm = state.bpm + num;
    if (newbpm >= BeatsData.minbpm && newbpm <= BeatsData.maxbpm) {
      state = BeatsData(bpm: newbpm);
    }
  }
}
