import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/Register/presentation/Mangments/CreatAcountState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatAccount extends Cubit<CratAccountState> {
  CreatAccount() : super(InitalState());
  static CreatAccount get(context) => BlocProvider.of(context);

  bool obscureText = false;
  IconData icon = Icons.visibility_outlined;

  void changepassWord() {
    obscureText = !obscureText;
    icon =
        obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit((ChangeIconSuffix()));
  }

  void creatUser({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) {
    emit(CreatLodingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user?.email);
      emit(CreatScafullState());
    }).catchError((error) {
      print(error.toString());
      emit(CreatErrorState(error.toString()));
    });
  }
}
