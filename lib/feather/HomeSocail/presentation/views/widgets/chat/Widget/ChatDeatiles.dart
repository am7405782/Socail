import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Model/SocailModel.dart';
import 'package:flutter_application_2/core/Model/chatModel.dart';
import 'package:flutter_application_2/core/shard/Local/Shardprfrence.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocailState.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

chatDeatiles(SocailModel? user) {
  var massageController = TextEditingController();
  var uid = CacheHealper.getData(key: "uid");

  return BlocProvider(
    create: (context) => SocailBloc()
      ..getmessages(
        resiverId: user!.uid!,
      ),
    child: BlocConsumer<SocailBloc, SocailState>(
      listener: (context, state) {
        if (state is LodingUploadChatImageState) {
          CircularProgressIndicator();
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: true,
          builder: (context) => Scaffold(
            appBar: AppBar(
              titleSpacing: 0.0,
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "${user?.image}",
                    ),
                    radius: 20,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "${user?.name}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    SocailBloc.get(context).getChatimage(
                      chatImage: '',
                      reseverId: user!.uid!,
                      dateTime: DateTime.now().toString(),
                      text: "",
                    );
                  },
                  icon: const Icon(Icons.camera_alt),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          if (user?.uid ==
                              SocailBloc.get(context)
                                  .messages[index]
                                  .senderId) {
                            return buildMessage(
                                SocailBloc.get(context).messages[index]);
                          }
                          return buildMyMessage(
                              SocailBloc.get(context).messages[index]);
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 15),
                        itemCount: SocailBloc.get(context).messages.length),
                  ),
                  TextFormField(
                    controller: massageController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          // SocailBloc.get(context).sendMessagechat(
                          //     reseverId: user!.uid!,
                          //     dateTime: DateTime.now().toString(),
                          //     text: massageController.text);
                          SocailBloc.get(context).sendMessagechat(
                            text: massageController.text,
                            dateTime: DateTime.now().toString(),
                            reseverId: user!.uid!,
                          );
                          massageController.clear();
                        },
                        icon: const Icon(
                          Icons.send,
                        ),
                      ),
                      hintText: "message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    ),
  );
}

Widget buildMessage(ChatModel? massge) => Align(
      alignment: AlignmentDirectional.topStart,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10),
                topEnd: Radius.circular(10),
                bottomStart: Radius.circular(10),
              ),
            ),
            child: Text(
              "${massge?.text}",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     borderRadius: const BorderRadiusDirectional.only(
          //       bottomEnd: Radius.circular(10),
          //       topEnd: Radius.circular(10),
          //       bottomStart: Radius.circular(10),
          //     ),
          //   ),
          //   child: Text(
          //     "${massge?.dateTime}",
          //     style: TextStyle(color: Colors.grey, fontSize: 16),
          //   ),
          // ),
        ],
      ),
    );

Widget buildMyMessage(ChatModel? massge) => Align(
      alignment: AlignmentDirectional.topEnd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: const BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10),
                bottomStart: Radius.circular(10),
                topStart: Radius.circular(10),
              ),
            ),
            child: Text(
              "${massge?.text}",
              style: const TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          if (massge?.chatImage != "")
            Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, // Adjust the BoxFit as needed
                    image: NetworkImage(
                      "${massge?.chatImage}",
                    ) // Use the message's image URL
                    ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
          // Container(
          //   padding: const EdgeInsets.all(10),
          //   decoration: const BoxDecoration(
          //     borderRadius: BorderRadiusDirectional.only(
          //       bottomEnd: Radius.circular(10),
          //       topEnd: Radius.circular(10),
          //       bottomStart: Radius.circular(10),
          //     ),
          //   ),
          //   child: Text(
          //     "${massge?.dateTime}",
          //     style: const TextStyle(color: Colors.grey, fontSize: 16),
          //   ),
          // ),
        ],
      ),
    );
