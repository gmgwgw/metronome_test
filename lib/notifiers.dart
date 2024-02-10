import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models.dart';

class BeatsNotifier extends StateNotifier<BeatsData> {
  // 初期値
  BeatsNotifier() : super(const BeatsData(bpm: 120));

  void changeBpm(int num) {
    int newbpm = state.bpm + num;
    if (newbpm >= BeatsData.minbpm && newbpm <= BeatsData.maxbpm) {
      state = BeatsData(bpm: newbpm);
    }
  }
}

class IsRunningNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void invert() {
    state = !state;
  }
}
