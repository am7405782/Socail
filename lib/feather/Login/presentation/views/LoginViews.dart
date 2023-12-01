import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/Login/presentation/Mangments/LoginBloc.dart';
import 'package:flutter_application_2/feather/Login/presentation/Mangments/LoginState.dart';
import 'package:flutter_application_2/feather/Login/presentation/views/widgets/customButton.dart';
import 'package:flutter_application_2/feather/Login/presentation/views/widgets/textFaildLogin.dart';
import 'package:flutter_application_2/feather/Register/presentation/views/CreatAccountViews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  static const String nameKey = "Login";

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
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
                    child: Column(
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
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
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
                                // LoginBloc.get(context).userLogin(
                                //     email: emailController.text,
                                //     password: passWordController.text);
                              }
                              // navigatTo(
                              //     navig: const HomeLayOut(), context: context);
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
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
