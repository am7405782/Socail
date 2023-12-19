import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Constant.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocailState.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPhotoPost extends StatelessWidget {
  const NewPhotoPost({super.key});

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
            title: const Text("New Photes "),
            actions: [
              MaterialButton(
                onPressed: () {
                  if (SocailBloc.get(context).imagephoto == null) {
                    SocailBloc.get(context).creatAddPhoto(
                      text: textControll.text,
                      dateTime: time.toString(),
                    );
                  } else {
                    SocailBloc.get(context).uploadPhotoImage(
                      date: time.toString(),
                      text: textControll.text,
                      postImage: "",
                    );
                  }
                },
                child: const Text(
                  "NeWPotoes",
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
                if (state is LodingCraeatAppPhoto)
                  const LinearProgressIndicator(),
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
                TextFormField(
                  controller: textControll,
                  decoration: const InputDecoration(
                    hintText: " Caption Photo",
                    border: InputBorder.none,
                    helperMaxLines: 3,
                  ),
                ),
                if (SocailBloc.get(context).imagephoto != null)
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
                                    SocailBloc.get(context).imagephoto!),
                                fit: BoxFit.cover),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            SocailBloc.get(context).removeimagephoto();
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
                if (SocailBloc.get(context).imagephoto == null)
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue),
                      child: const Center(
                        child: Text(
                          "PleasAddPhoto",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                const Divider(height: 20, thickness: 0.5, color: Colors.grey),
                Row(
                  children: [
                    Expanded(
                        child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: IconButton(
                          onPressed: () {
                            SocailBloc.get(context).getImagePhotocamra();
                          },
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          )),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: IconButton(
                          onPressed: () {
                            SocailBloc.get(context).getImagePhotogallery();
                          },
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          )),
                    ))
                  ],
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is RemovepostImage) {
          SocailBloc.get(context).imagephoto = null;
          tost(text: "Photo remove ", state: ToastStae.waring);
        } else if (state is ScafullUploadPostImageState) {
          tost(text: "ScafullAddphoto", state: ToastStae.succes);
          Navigator.pop(context);
        } else if (state is LodingUploadPostImageState) {
          tost(text: "Lodingimage ", state: ToastStae.waring);
        }
      },
    );
  }
}
