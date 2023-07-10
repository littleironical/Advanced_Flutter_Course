import 'dart:async';
import 'package:advanced_flutter_course/presentation/resources/assets_manager.dart';
import 'package:advanced_flutter_course/presentation/resources/colors_manager.dart';
import 'package:advanced_flutter_course/presentation/resources/routes_manager.dart';
import 'package:advanced_flutter_course/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  _waitAndGoToNextView() async {
    await Future.delayed(const Duration(milliseconds: AppDurationManager.d1500), () {});
    _goNextView();
  }

  _goNextView() {
    Navigator.pushReplacementNamed(context, RoutesManager.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _waitAndGoToNextView();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image(
          image: AssetImage(ImageAssetManager.splashLogo),
        ),
      ),
    );
  }
}
