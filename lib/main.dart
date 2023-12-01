import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/shard/Blocopserved.dart';
import 'package:flutter_application_2/core/shard/Local/Shardprfrence.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/HomeSocail.dart';
import 'package:flutter_application_2/feather/Login/presentation/views/LoginViews.dart';
import 'package:flutter_application_2/feather/OnBording/presentation/Views/OnBordingScreen.dart';
import 'package:flutter_application_2/feather/Register/presentation/views/CreatAccountViews.dart';
import 'package:flutter_application_2/feather/Splash/presentation/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyBIl9tf3WkEvIKL9hqF__2rkZp0bVpFwco",
              appId: "1:728404698408:android:b6d16f6c83be4a1cf0dc1d",
              messagingSenderId: "728404698408",
              projectId: "test-ba8a5",
              storageBucket: "test-ba8a5.appspot.com"))
      : await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHealper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.nameKey,
      routes: {
        SplashView.nameKey: (_) => const SplashView(),
        OnBordingView.nameKey: (_) => const OnBordingView(),
        Login.nameKey: (_) => const OnBordingView(),
        HomeSocail.nameKey: (_) => const HomeSocail(),
        CreatAccountViews.nameKey: (_) => const CreatAccountViews(),
      },
    );
  }
}
