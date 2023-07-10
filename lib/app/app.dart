import 'package:advanced_flutter_course/presentation/resources/routes_manager.dart';
import 'package:advanced_flutter_course/presentation/resources/themes_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  // MyApp._internal(); // private named constructor
  //
  // int appState = 0;
  //
  // static final MyApp instance = MyApp._internal(); // single instance -- singleton
  //
  // factory MyApp() => instance; // factory for class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.route,
      initialRoute: RoutesManager.splashRoute,
      theme: appThemeManager(),
    );
  }
}
