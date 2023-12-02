import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Model/SocailModel.dart';
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
      creatSaveData(
        email: email,
        name: name,
        phone: phone,
        uid: value.user!.uid,
      );
      print(value.user?.email);
      emit(CreatScafullState());
    }).catchError((error) {
      print(error.toString());
      emit(CreatErrorState(error.toString()));
    });
  }

  void creatSaveData({
    required String name,
    required String email,
    required String phone,
    required String uid,
  }) {
    SocailModel? model = SocailModel(
      email: email,
      name: name,
      phone: phone,
      uid: uid,
    );
    emit(SaveDataFireStoreLoding());
    FirebaseFirestore.instance
        .collection("user")
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(SaveDataFireStoreScafull());
    }).catchError((eror) {
      emit(SaveDataFireStoreerror());
    });
  }
}
