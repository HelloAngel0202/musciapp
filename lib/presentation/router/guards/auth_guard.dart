import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/notifiers.dart';
import 'package:go_router/go_router.dart';

import '../../global/blocs/session/session_bloc.dart';
import '../routes/sign_in.dart';

Future<String?> authGuard(BuildContext context, GoRouterState state) async {
  final user = sessionprovaider.read().state;

  if (user != null){
    return null;
  }

  return SignInRoute.path;
}
