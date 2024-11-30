
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/notifiers.dart';
import 'package:flutter_meedu/providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';
import 'video_player_state.dart';

final videoPlayersProvaider = Provider.stateArgumentsTag<VideoPlayerBloc,VideoPlayerState,String>(
(ref) => VideoPlayerBloc(
    
    VideoPlayerState.loading(),
   controller: VideoPlayerController.networkUrl(

    Uri.parse(ref.arguments),


   ),
   
   ).. init(),



); 


class VideoPlayerBloc extends StateNotifier<VideoPlayerState> {
  VideoPlayerBloc(
    super.initialState,{
    required this.controller,
    });

    final VideoPlayerController controller;

    VideoPlayerLodedState get  loadedState => switch (state){

      VideoPlayerLodedState state => state,
      _ => throw AssertionError('Invalid state'),


    };

  

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
          await play()
          ;


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


    Future<void> play() async {
      await controller.play();
       state = loadedState.copyWith(
          paused: false,

        
        );

    }

     Future<void> pause() async {
      state = loadedState.copyWith(
          paused: true,

        
        );

    }

    @override
    FutureOr<void> dispose(){
      controller.removeListener(_listener);
      controller.dispose();
      //song -
     return super.dispose();
    }
  
  
}

