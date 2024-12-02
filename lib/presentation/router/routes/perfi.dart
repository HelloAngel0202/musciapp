import 'package:go_router/go_router.dart';

import '../../modules/home/submodules/friends/friends_view.dart';
import '../guards/auth_guard.dart';

class PerfirRoute {
  static const path = '/perfir';
  static const name = 'Perfir';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: name,
      redirect: authGuard,
      builder: (_, state) => const FriendsView(),
    );
  }
}
