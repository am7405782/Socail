import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocailState.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/chat/Chat.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/feeds/Feeds.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/setting/Setting.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/user/User.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocailBloc extends Cubit<SocailState> {
  SocailBloc() : super(InitalState());
  static SocailBloc get(context) => BlocProvider.of(context);

  int currentindex = 0;
  List<String> title = [
    "Home",
    "Chat",
    "User",
    "profail",
  ];
  List<Widget> views = [
    const Feeds(),
    const ChatScreen(),
    const UserScreen(),
    const SettingScreen(),
  ];
  void changeBootomSheet(int index) {
    currentindex = index;
    emit(ChangeBottonSheet());
  }
}
