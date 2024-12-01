import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer/consumer_widget.dart';
import 'package:video_player/video_player.dart';

import '../../../../../domain/models/reel.dart';
import '../../blocs/video_player/video_player_bloc.dart';
import '../../blocs/video_player/video_player_state.dart';
import 'actions.dart';
import 'info.dart';
import 'video_player.dart';

class ReelViewer extends StatelessWidget {
  const ReelViewer({super.key, required this.reel});
  final Reel reel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer(
          builder: (_,ref, __){
           final bloc = ref.watch(
              videoPlayersProvaider,
              tag: reel.id,
              );
              return switch(bloc.state){
                videoPlayersLoadingstate _ => const Center (
                  child: CircularProgressIndicator(),
                ),
                videoPlayersFaliedstate _ => Center(
                  child: TextButton(
                    onPressed: bloc.init,
                    child: const Text('Retry'), 
                ),
              ),
                  VideoPlayerLodedState _=> SizedBox.expand(child: MyvideoPlayer(
                    controller: bloc.controller,
                  ),
                  ),
            };
          },
        ),
         Consumer(
          builder: (_,ref, __){
           final bloc = ref.watch(
              videoPlayersProvaider,
              tag: reel.id,
              );
              return switch(bloc.state){
                  VideoPlayerLodedState state=> Positioned.fill(child:GestureDetector(
                    onTap: (){
                      if(state.paused){
                        bloc.play();
                      }else{
                        bloc.pause();
                      }
                    },
                    child:  Container(
                        color: Colors.black26,
                       child: state.paused? Center(
                      child: Icon(
                        Icons.play_arrow,
                        size: 80,
                      ),
                        ):const SizedBox.shrink(),
                      ),
                   
                ),
                ),
                _ => const SizedBox.shrink(),
            };
          },
         ),


        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ReelInfo(reel: reel),
        ),
        Positioned(
          right: 20,
          bottom: 40,
          child: ReelActions(reel: reel),
        ),
        













      ],
    );
  }
}
