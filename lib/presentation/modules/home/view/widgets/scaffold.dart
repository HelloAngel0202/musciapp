import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'bottom_navigation_bar.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Future<void> goTo(HomeBottomNavigationBarItem item) async {
      context.go(item.routePath);




    }

    return Scaffold(
      body: child,
      bottomNavigationBar: HomeBottomNavigationBar(
        currentLocation: '',
        onTap: goTo,
      ),
    );
  }
}
