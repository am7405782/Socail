import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Constant.dart';
import 'package:flutter_application_2/core/shard/Local/Shardprfrence.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/HomeSocail.dart';
import 'package:flutter_application_2/feather/Login/presentation/Mangments/LoginBloc.dart';
import 'package:flutter_application_2/feather/Login/presentation/Mangments/LoginState.dart';
import 'package:flutter_application_2/feather/Login/presentation/views/widgets/LoginBody.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  static const String nameKey = "Login";

  var formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoadingLoginState) {
            const Center(child: CircularProgressIndicator());
          } else if (state is ScafullLoginState) {
            CacheHealper.SavedData(key: "uid", value: state.uid);

            Navigator.of(context)
                .pushNamedAndRemoveUntil(HomeSocail.nameKey, (route) => false);
          } else if (state is ErorrLoginState) {
            tost(
              state: ToastStae.eror,
              text: state.Error,
            );
          }
        },
        builder: (context, state) {
          return LoginBody(
              formkey: formkey,
              size: size,
              emailController: emailController,
              passwordController: passwordController);
        },
      ),
    );
  }
}
