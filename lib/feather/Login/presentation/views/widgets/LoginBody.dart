import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/Login/presentation/views/widgets/FormBodyLogin.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
    required this.formkey,
    required this.size,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formkey;
  final Size size;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.1),
                ],
              ),
            ),
            child: Form(
              key: formkey,
              child: FormBodyLogin(
                  size: size,
                  emailController: emailController,
                  passwordController: passwordController,
                  formkey: formkey),
            ),
          ),
        ),
      ),
    );
  }
}
