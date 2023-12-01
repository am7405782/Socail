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
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
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
