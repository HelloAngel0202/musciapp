import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../modules/home/submodules/profile/profile_view.dart';
import '../../modules/user_profile/view/user_profiler_view.dart';
import 'home.dart';


class UserProfileRouter {
  static const path = '/user-profile/userId';
  static const name = 'user Profile';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: name,
      redirect: (_, State){
        final userId = State.pathParameters['userId']; 
        if (userId == null){
          return HomeRoute.path;
        }
        return null;

      },
     
      builder: (_, state) => UserProfileview(
        userId:state.pathParameters['userId']!,
        
        
        ),
    );
  }
}
