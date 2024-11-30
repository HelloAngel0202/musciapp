import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer/consumer_widget.dart';
import 'package:flutter_meedu/screen_utils.dart';
import 'package:video_player/video_player.dart';

import '../../../../../domain/models/reel.dart';
import '../../blocs/video_player/video_player_bloc.dart';
import '../../blocs/video_player/video_player_state.dart';

class ReelInfo extends StatelessWidget {
  const ReelInfo({super.key, required this.reel});
  final Reel reel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black38,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20).copyWith(
              bottom: 10,
            ),
            child: Text(
              reel.autor.displayName,
              style: context.textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 0,
              left: 20,
              right: 60,
              bottom: 20,
            ),
            child: Text(
              reel.description,
              style: context.textTheme.labelMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          /// START VIDEO PLAYER SLIDER
          /// 
          Consumer(
            
            
            builder: (_,ref,__){
              final bloc = ref.watch(
                
                videoPlayersProvaider,
                tag:reel.id,

                
                );
                return switch (bloc.state){
                  VideoPlayerLodedState state => LinearProgressIndicator(
                  value: state.position.inSeconds/state.duration.inSeconds,
                  ),
                  _=> SizedBox.shrink(),
                };


            },
            
            ),
       
          /// 
          /// END VIDEO PLAYER SLIDER
        ],
      ),
    );
  }
}
