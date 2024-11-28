
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/notifiers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';
import 'video_player_state.dart';



class VideoPlayerBloc extends StateNotifier<VideoPlayerState> {
  VideoPlayerBloc(
    super.initialState,{
    required this.controller,
    });

    final VideoPlayerController controller;
  

    Future<void> init() async{
      try {
        state = VideoPlayerState.loading();

        await controller.initialize();
        await controller.setLooping(true);
        controller.addListener(_listener);

        state= VideoPlayerState.loaded(
          duration: controller.value.duration, 
          position: Duration.zero,
          
          );

      } catch(_){
        state = VideoPlayerState.falied();



      }

      
    }


    void _listener(){
      switch (state){
        case VideoPlayerLodedState lodedState:
        state = lodedState.copyWith(

          position: controller.value.position
        );
        case _:
      }
     

    }

    @override
    FutureOr<void> dispose(){
      controller.removeListener(_listener);
      controller.dispose();
     return super.dispose();
    }
  
  
}

