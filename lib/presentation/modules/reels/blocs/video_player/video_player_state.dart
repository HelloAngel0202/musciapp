

import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_player_state.freezed.dart';


@freezed

sealed class VideoPlayerState with _$VideoPlayerState{
  factory VideoPlayerState.loading()= videoPlayersLoadingstate;
  factory VideoPlayerState.falied()= videoPlayersFaliedstate;
  factory VideoPlayerState.loaded({

    required Duration duration,
    required Duration position,
    @Default(false) bool paused,


  }) = VideoPlayerLodedState;


}

