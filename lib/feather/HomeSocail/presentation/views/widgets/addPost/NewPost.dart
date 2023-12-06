import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocailState.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_application_2/feather/Login/presentation/views/widgets/customButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPost extends StatelessWidget {
  static const String nameKey = "NewPost";
  const NewPost({super.key});

  @override
  Widget build(BuildContext context) {
    var textControll = TextEditingController();
    DateTime time = DateTime.now();
    return BlocConsumer<SocailBloc, SocailState>(
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
            titleSpacing: 5,
            title: const Text("New Post "),
            actions: [
              MaterialButton(
                onPressed: () {
                  if (SocailBloc.get(context).imagepost == null) {
                    SocailBloc.get(context).creatPost(
                      text: textControll.text,
                      datetime: time.toString(),
                    );
                  } else {
                    SocailBloc.get(context).uploadpostImageImage(
                      date: time.toString(),
                      text: textControll.text,
                      postImage: "",
                    );
                  }
                },
                child: const Text(
                  "post",
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
          body: Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 5),
            child: Column(
              children: [
                // if (state is SocailCreatPostLodiingState)
                // const LinearProgressIndicator(),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                          "${SocailBloc.get(context).usermodel?.image}"),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "${SocailBloc.get(context).usermodel?.name}",
                      style: const TextStyle(
                        height: 1.4,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: TextFormField(
                    controller: textControll,
                    decoration: const InputDecoration(
                      hintText: "  what is your mined.....",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if (SocailBloc.get(context).imagepost != null)
                  Expanded(
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(
                                image: FileImage(
                                    SocailBloc.get(context).imagepost!),
                                fit: BoxFit.cover),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            SocailBloc.get(context).removeImgePOst();
                          },
                          icon: const CircleAvatar(
                            child: Icon(
                              Icons.close_rounded,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                const Divider(height: 20, thickness: 0.5, color: Colors.grey),
                Row(
                  children: [
                    Expanded(
                      child: customButton(
                          text: "AddPhoto",
                          height: 30,
                          onTap: () {
                            SocailBloc.get(context).getpostimage();
                          }),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: customButton(
                            text: "#tag", height: 30, onTap: () {}))
                  ],
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is RemovepostImage) {
          SocailBloc.get(context).imagepost = null;
        } else if (state is ScafullCreatPoststate) {
          Navigator.pop(context);
        }
      },
    );
  }
}
