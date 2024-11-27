import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer/consumer_widget.dart';

import '../blocs/reels/reels_bloc.dart';
import '../blocs/reels/reels_state.dart';
import 'widgets/reels_page_view.dart';

class ReelsView extends StatelessWidget {
  const ReelsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      
      builder: (_,ref,__){
       final bloc =  ref.watch(reelsProvaider);
       return switch(bloc.state){
        ReelsloadingState _ => const Center(

          child: CircularProgressIndicator(),


        ),

        ReelsfailedStat _ =>  Center(
          child: TextButton(
            onPressed: bloc.init, 
            child: const Text('Retry')
            
            ),

        ),
        ReelsloadedState state => ReelsPageView
        (
          reels: state.reels,
        
        ),


      };
    },
      
   );
  }
}
