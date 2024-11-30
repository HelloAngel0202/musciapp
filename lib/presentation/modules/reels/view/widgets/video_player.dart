
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class MyvideoPlayer extends StatelessWidget {

  const MyvideoPlayer({
    
    super.key,
    required this.controller,



  });

  final VideoPlayerController controller;
  
  @override
  Widget build(BuildContext context) {

    final size = controller.value.size;
    return SizedBox.expand(
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