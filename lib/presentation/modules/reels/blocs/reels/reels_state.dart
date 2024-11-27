




import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/reel.dart';

part 'reels_state.freezed.dart';

@freezed
sealed class ReelsState with _$ReelsState {
  factory ReelsState.loading() = ReelsloadingState;
  factory ReelsState.failed() = ReelsfailedStat;
  factory ReelsState.loaded({
    required List<Reel> reels,



  }) = ReelsloadedState;
  
}