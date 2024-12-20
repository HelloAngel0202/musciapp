import 'package:flutter/material.dart';

import 'global/colors.dart';
import 'modules/home/view/widgets/scaffold.dart';
import 'router/provaide.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerprovider.read(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.dark,
        primaryColorDark: AppColors.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.dark,
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.red,
        ),
        canvasColor: AppColors.dark,
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            backgroundColor: const MaterialStatePropertyAll(Colors.red),
            foregroundColor: const MaterialStatePropertyAll(Colors.white),
          ),
        ),
      ),
    );
  }
}
