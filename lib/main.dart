import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Constant.dart';
import 'package:flutter_application_2/core/shard/Blocopserved.dart';
import 'package:flutter_application_2/core/shard/Local/Shardprfrence.dart';
import 'package:flutter_application_2/core/shard/theam/theam.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocailState.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/HomeSocail.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/addPost/NewPost.dart';
import 'package:flutter_application_2/feather/Login/presentation/views/LoginViews.dart';
import 'package:flutter_application_2/feather/OnBording/presentation/Views/OnBordingScreen.dart';
import 'package:flutter_application_2/feather/Register/presentation/views/CreatAccountViews.dart';
import 'package:flutter_application_2/feather/Splash/presentation/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print('Message data: ${message.data.toString()}');
  tost(text: "Handling a background message", state: ToastStae.succes);
}

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
  var token = await FirebaseMessaging.instance.getToken();
  print(token);

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    tost(text: "onMessage", state: ToastStae.succes);

    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data.toString()}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print(event.data.toString());
    tost(text: "onMessageOpenedApp", state: ToastStae.succes);
  });
  Bloc.observer = MyBlocObserver();
  await CacheHealper.init();
  var uid = CacheHealper.getData(key: "uid");
  print(uid);

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
      child: BlocListener<SocailBloc, SocailState>(
        listener: (context, state) {
          if (state is ScafullGetPostState) {}
        },
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
      ),
    );
  }
}
