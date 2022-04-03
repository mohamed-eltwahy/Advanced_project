import 'dart:async';

import 'package:flutter/material.dart';

import '../../resources/assets.dart';
import '../../resources/colors.dart';
import '../../routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({ Key? key }) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 5), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body:  const Center(child: Image(image: AssetImage(AssetsManaget.splashLogo))),
      
    );
  }
}