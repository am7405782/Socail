import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/HomeSocail.dart';
import 'package:flutter_application_2/feather/Register/presentation/Mangments/CreatAccountBloc.dart';
import 'package:flutter_application_2/feather/Register/presentation/Mangments/CreatAcountState.dart';
import 'package:flutter_application_2/feather/Register/presentation/views/widgets/FormBody.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CreatAccountViews extends StatelessWidget {
  static const String nameKey = "CreatAccountViews";

  var formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  var passwoedController = TextEditingController();

  CreatAccountViews({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => CreatAccount(),
      child: BlocConsumer<CreatAccount, CratAccountState>(
        listener: (context, state) {
          if (state is CreatLodingState) {
            const Center(child: CircularProgressIndicator());
          } else if (state is CreatScafullState) {
            Navigator.of(context).pushNamed(HomeSocail.nameKey);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: CreatAccountbody(
                formkey: formkey,
                size: size,
                nameController: nameController,
                emailController: emailController,
                phoneController: phoneController,
                passwoedController: passwoedController),
          );
        },
      ),
    );
  }
}

class CreatAccountbody extends StatelessWidget {
  const CreatAccountbody({
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
    return SafeArea(
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
          child: FormBody(
              formkey: formkey,
              size: size,
              nameController: nameController,
              emailController: emailController,
              phoneController: phoneController,
              passwoedController: passwoedController),
        ),
      ),
    );
  }
}
