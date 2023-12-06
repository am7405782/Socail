import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/shard/Blocopserved.dart';
import 'package:flutter_application_2/core/shard/Local/Shardprfrence.dart';
import 'package:flutter_application_2/core/shard/theam/theam.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/HomeSocail.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/addPost/NewPost.dart';
import 'package:flutter_application_2/feather/Login/presentation/views/LoginViews.dart';
import 'package:flutter_application_2/feather/OnBording/presentation/Views/OnBordingScreen.dart';
import 'package:flutter_application_2/feather/Register/presentation/views/CreatAccountViews.dart';
import 'package:flutter_application_2/feather/Splash/presentation/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => SocailBloc()
              ..getUserData()
              ..getPost()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheam,
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? SplashView.nameKey
            : HomeSocail.nameKey,
        routes: {
          SplashView.nameKey: (_) => const SplashView(),
          OnBordingView.nameKey: (_) => const OnBordingView(),
          Login.nameKey: (_) => Login(),
          HomeSocail.nameKey: (_) => const HomeSocail(),
          CreatAccountViews.nameKey: (_) => CreatAccountViews(),
          NewPost.nameKey: (_) => NewPost(),
        },
      ),
    );
  }
}
