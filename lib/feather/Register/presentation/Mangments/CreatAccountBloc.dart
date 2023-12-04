import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Model/SocailModel.dart';
import 'package:flutter_application_2/core/shard/Local/Shardprfrence.dart';
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
      bio: "writebio.",
      cover:
          "https://images.pexels.com/photos/268941/pexels-photo-268941.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      image:
          "https://images.pexels.com/photos/5588224/pexels-photo-5588224.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    );
    emit(SaveDataFireStoreLoding());
    FirebaseFirestore.instance
        .collection("user")
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      CacheHealper.SavedData(key: "id", value: uid);
      print(uid);
      emit(SaveDataFireStoreScafull());
    }).catchError((eror) {
      emit(SaveDataFireStoreerror());
    });
  }
}
