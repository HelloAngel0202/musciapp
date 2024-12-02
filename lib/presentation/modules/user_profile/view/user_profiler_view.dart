

import 'package:flutter/material.dart';

class UserProfileview extends StatelessWidget {
  const UserProfileview({super.key,required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton( 
          onPressed: () {
          },
          child: const Text('Reels')
        ),
      ),

    );
  }
}