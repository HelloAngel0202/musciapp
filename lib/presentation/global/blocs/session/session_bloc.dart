
import 'package:flutter_meedu/notifiers.dart';
import 'package:flutter_meedu/providers.dart';

import '../../../../domain/models/user.dart';

final sessionprovaider = StateNotifierProvider<SessionBloc,User?>(
  (ref) => SessionBloc(null),
  autoDispose: false, 
);

class SessionBloc extends StateNotifier<User?>{
  SessionBloc(super.initialState);
  
void setUser(User User){
  state = User;
} 
void logOut(){
  state = null;
}

}