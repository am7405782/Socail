import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocailState.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/chat/Widget/BodyCaht.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocailBloc, SocailState>(
      listener: (context, state) {},
      builder: (context, state) {
        var allUser = SocailBloc.get(context);
        return ConditionalBuilder(
          condition: allUser.user.isNotEmpty,
          builder: (context) => Scaffold(
            body: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  chatItemas(context, allUser.user[index]),
              separatorBuilder: (context, index) =>
                  const Divider(height: 20, thickness: 0.5, color: Colors.grey),
              itemCount: allUser.user.length,
            ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
