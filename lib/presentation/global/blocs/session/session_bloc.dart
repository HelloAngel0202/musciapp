
import 'package:flutter_meedu/notifiers.dart';
import 'package:flutter_meedu/providers.dart';

import '../../../../core/either.dart';
import '../../../../core/typedefs.dart';
import '../../../../domain/failures/failure.dart';
import '../../../../domain/models/user.dart';
import '../../../../domain/repositories/auth_repository.dart';
import '../../../Repositories.dart';
import '../../domain/repositories/auth_repository.dart';
 
final sessionprovaider = StateNotifierProvider<SessionBloc,User?>(
  (ref) => SessionBloc(null, auth_repository: Repositories.auth.read(),),
  autoDispose: false, 
);

class SessionBloc extends StateNotifier<User?>{
  SessionBloc(
    super.initialState,{
    required AuthRepository auth_repository,
  }) : _auth_repository = auth_repository;


  final AuthRepository _auth_repository;

 FutureEither<Failure,User>singIn() async{
  final result = await  _auth_repository.signIn() ;

  switch(result){


    
    
    case Right (value: final User):
    state = User;
    case Left _:
      
  }



  return result;


 }
  
 


void logOut(){
  state = null;
}











} 
