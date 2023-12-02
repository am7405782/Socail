import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/Register/presentation/views/widgets/Registerbody.dart';

class FormBody extends StatelessWidget {
  const FormBody({
    super.key,
    required this.formkey,
    required this.size,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwoedController,
  });

  final GlobalKey<FormState> formkey;
  final Size size;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwoedController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Registerbody(
          size: size,
          nameController: nameController,
          emailController: emailController,
          phoneController: phoneController,
          passwoedController: passwoedController,
          formkey: formkey),
    );
  }
}
