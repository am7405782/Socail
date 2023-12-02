import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/Login/presentation/Mangments/LoginState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(InitalState());
  static LoginBloc get(context) => BlocProvider.of(context);

  bool obscureText = false;
  IconData icon = Icons.visibility_outlined;

  void changepassWord() {
    obscureText = !obscureText;
    icon =
        obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeIconSuffix());
  }

  void signInWithemailpassword(
    String email,
    String password,
  ) {
    try {
      emit(LoadingLoginState());
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        emit(ScafullLoginState(value.user!.uid));
      }).catchError((eror) {
        emit(ErorrLoginState(eror));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        emit(ErorrLoginState(e));
      } else if (e.code == 'wrong-password') {
        emit(ErorrLoginState(e));
        print('Wrong password provided for that user.');
      }
    }
  }
}
