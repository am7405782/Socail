import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/Login/presentation/Mangments/LoginBloc.dart';
import 'package:flutter_application_2/feather/Login/presentation/views/widgets/customButton.dart';
import 'package:flutter_application_2/feather/Login/presentation/views/widgets/textFaildLogin.dart';
import 'package:flutter_application_2/feather/Register/presentation/views/CreatAccountViews.dart';

class FormBodyLogin extends StatelessWidget {
  const FormBodyLogin({
    super.key,
    required this.size,
    required this.emailController,
    required this.passwordController,
    required this.formkey,
  });

  final Size size;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.022,
        ),
        const Center(
          child: Text(
            "Socail ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 42,
              height: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.22,
        ),
        const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 42,
            height: 1,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: size.height * 0.022,
        ),
        const Text(
          "ConncationWitheFrinds",
          style: TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: size.height * 0.022,
        ),
        textFaildLogin(
          onPressedicon: () {},
          name: "Email",
          prefixIcon: Icons.email_outlined,
          controller: emailController,
          hintText: "...@_.com",
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {},
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Pleas enter email';
            }
            return null;
          },
        ),
        SizedBox(
          height: size.height * 0.022,
        ),
        textFaildLogin(
          onPressedicon: () {
            LoginBloc.get(context).changepassWord();
          },
          obscureText: LoginBloc.get(context).obscureText,
          name: "Password",
          prefixIcon: Icons.lock_outline,
          controller: passwordController,
          hintText: "***",
          suffixIcon: LoginBloc.get(context).icon,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {},
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Pleas enter password';
            }
            return null;
          },
        ),
        SizedBox(
          height: size.height * 0.022,
        ),
        customButton(
            text: "LOGIN",
            height: 50,
            onTap: () {
              if (formkey.currentState!.validate()) {
                LoginBloc.get(context).signInWithemailpassword(
                    emailController.text, passwordController.text);
              }
            }),
        SizedBox(
          height: size.height * 0.03,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                CreatAccountViews.nameKey, (route) => false);
          },
          child: const Center(
            child: Text(
              "CreatAccount...!!",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
