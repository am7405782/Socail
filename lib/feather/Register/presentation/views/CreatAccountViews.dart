import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/HomeSocail.dart';
import 'package:flutter_application_2/feather/Login/presentation/views/widgets/customButton.dart';
import 'package:flutter_application_2/feather/Login/presentation/views/widgets/textFaildLogin.dart';
import 'package:flutter_application_2/feather/Register/presentation/Mangments/CreatAccountBloc.dart';
import 'package:flutter_application_2/feather/Register/presentation/Mangments/CreatAcountState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatAccountViews extends StatefulWidget {
  static const String nameKey = "CreatAccountViews";

  const CreatAccountViews({super.key});

  @override
  State<CreatAccountViews> createState() => _CreatAccountViewsState();
}

class _CreatAccountViewsState extends State<CreatAccountViews> {
  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwoedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => CreatAccount(),
      child: BlocConsumer<CreatAccount, CratAccountState>(
        listener: (context, state) {
          if (state is CreatLodingState) {
            const Center(child: CircularProgressIndicator());
          }
          if (state is CreatScafullState) {
            Navigator.of(context).pushNamed(HomeSocail.nameKey);
          }
        },
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
                            "Creat Account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                              height: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.12,
                        ),
                        const Text(
                          "ConncationWitheFrinds",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: size.height * 0.052,
                        ),
                        textFaildLogin(
                          onPressedicon: () {},
                          name: "name",
                          prefixIcon: Icons.person_2_outlined,
                          controller: nameController,
                          hintText: "Enter Name",
                          keyboardType: TextInputType.name,
                          onChanged: (value) {},
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Pleas enter name';
                            }
                            return null;
                          },
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
                          onPressedicon: () {},
                          name: "phone",
                          prefixIcon: Icons.phone,
                          controller: phoneController,
                          hintText: "01036985674",
                          keyboardType: TextInputType.phone,
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
                            CreatAccount.get(context).changepassWord();
                          },
                          obscureText: CreatAccount.get(context).obscureText,
                          name: "Password",
                          prefixIcon: Icons.lock_outline,
                          controller: passwoedController,
                          hintText: "***",
                          suffixIcon: CreatAccount.get(context).icon,
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
                          height: size.height * 0.052,
                        ),
                        customButton(
                            text: "Register",
                            height: 50,
                            onTap: () {
                              if (formkey.currentState!.validate()) {
                                CreatAccount.get(context).creatUser(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    email: emailController.text,
                                    password: passwoedController.text);
                              }
                            }),
                        SizedBox(
                          height: size.height * 0.03,
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
