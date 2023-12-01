import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/Splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  static const String nameKey = "SplashView";

  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewbody(),
    );
  }
}
