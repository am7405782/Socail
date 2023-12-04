import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocailState.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPost extends StatelessWidget {
  static const String nameKey = "NewPost";

  const NewPost({super.key});

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    var size = MediaQuery.of(context).size;
    var bloc = SocailBloc.get(context);
    var date = DateTime.now();
    var ImgePost = SocailBloc.get(context).postimage;
    return BlocConsumer<SocailBloc, SocailState>(
      listener: (context, state) {
        if (state is ScafullCreatPoststate) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
              ),
            ),
            title: const Text(
              "NewPost",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (bloc.postimage == null) {
                    bloc.creatPost(
                      text: textController.text,
                      datetime: date.toString(),
                    );
                  } else {
                    bloc.uploadpostImageImage(
                      date: date.toString(),
                      text: textController.text,
                      postImage: "",
                    );
                  }
                },
                child: const Text(
                  "post",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "${bloc.usermodel?.image}",
                      ),
                      radius: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${bloc.usermodel?.name}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              const CircleAvatar(
                                radius: 8,
                                child: Icon(
                                  Icons.done_rounded,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            "${date}",
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TextField(
                    controller: textController,
                    cursorColor: Colors.grey,
                    decoration: const InputDecoration(
                      hintText: "What is Your mind...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if (bloc.postimage != null)
                  Container(
                    height: size.height * 0.25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(bloc.postimage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          SocailBloc.get(context).getpostProfail();
                        },
                        child: const Text(
                          "AddPhoto",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "AddTag#",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
