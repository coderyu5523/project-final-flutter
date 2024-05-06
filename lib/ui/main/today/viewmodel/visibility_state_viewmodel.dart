import 'package:flutter_riverpod/flutter_riverpod.dart';

class VisibilityState {
  bool fatVisible;
  bool muscleVisible;
  bool weightVisible;

  VisibilityState({
    this.fatVisible = true,
    this.muscleVisible = true,
    this.weightVisible = true,
  });

  // 상태 변경 함수
  VisibilityState copyWith({
    bool? fatVisible,
    bool? muscleVisible,
    bool? weightVisible,
  }) {
    return VisibilityState(
      fatVisible: fatVisible ?? this.fatVisible,
      muscleVisible: muscleVisible ?? this.muscleVisible,
      weightVisible: weightVisible ?? this.weightVisible,
    );
  }
}

final visibilityProvider =
    StateNotifierProvider<VisibilityNotifier, VisibilityState>((ref) {
  return VisibilityNotifier();
});

class VisibilityNotifier extends StateNotifier<VisibilityState> {
  VisibilityNotifier() : super(VisibilityState());

  void toggleFatVisibility() {
    state = state.copyWith(fatVisible: !state.fatVisible);
  }

  void toggleMuscleVisibility() {
    state = state.copyWith(muscleVisible: !state.muscleVisible);
  }

  void toggleWeightVisibility() {
    state = state.copyWith(weightVisible: !state.weightVisible);
  }
}
