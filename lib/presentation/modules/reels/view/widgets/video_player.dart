
import 'package:flutter/material.dart';
import 'package:flutter_meedu/notifiers.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../blocs/video_player/video_player_bloc.dart';
import 'reel_viewer.dart';

class MyvideoPlayer extends StatelessWidget {
  const MyvideoPlayer({
    super.key,
    required this.controller,
  });

  final VideoPlayerController controller;
  
  @override
  Widget build(BuildContext context) {
    final reel = context.findAncestorWidgetOfExactType<ReelViewer>()!.reel;


    final size = controller.value.size;
    return VisibilityDetector(
      key: Key(reel.id), 
      
      onVisibilityChanged: (info){
        if (info.visibleFraction ==0 && context.mounted){
          final bloc = videoPlayersProvaider.read(
            tag: reel.id,
          );
          bloc.pause();
         
          
        }

      }, 
      child: FittedBox(
         fit: BoxFit.cover,
           child: SizedBox(
             width: size.width,
              height: size.height,
                 child: VideoPlayer(
                    controller
                 ),
            ),
          ),
    
    );
    
  }





}