import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Constant.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocailState.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateScreen extends StatelessWidget {
  final String documentId;
  final String textPost;
  final String imagePost;

  const UpdateScreen(
      {super.key,
      required this.textPost,
      required this.documentId,
      required this.imagePost});

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
                SocailBloc.get(context).poto.clear();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
              ),
            ),
            titleSpacing: 5,
            title: const Text("UpdatePost"),
            actions: [
              MaterialButton(
                onPressed: () {
                  if (SocailBloc.get(context).imagephoto == null) {
                    SocailBloc.get(context).updateAddPhoto(
                      documentId: documentId,
                      text: textControll.text,
                      dateTime: time.toString(),
                    );
                  } else {
                    SocailBloc.get(context).updatePhotoImage(
                      date: time.toString(),
                      text: textControll.text,
                      postImage: "",
                      documentId: documentId,
                    );
                  }
                },
                child: const Text(
                  "Update",
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
                  decoration: InputDecoration(
                    hintText: "${textPost}",
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
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(
                                image: NetworkImage(imagePost),
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
                          icon: const Icon(
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
          tost(text: "Image Remove", state: ToastStae.succes);
        } else if (state is SuccessfulUpdateAppPhoto) {
          tost(text: "ScafullAddphoto", state: ToastStae.succes);
          SocailBloc.get(context).poto.clear();
          SocailBloc.get(context).getphoto();
          Navigator.pop(context);
        } else if (state is ErrorUpdatePostState) {
          tost(text: "error", state: ToastStae.eror);
        } else if (state is SuccessupdatePhotoImage) {
          tost(text: "getScafullimage", state: ToastStae.succes);
          SocailBloc.get(context).poto.clear();
          SocailBloc.get(context).getphoto();
        } else if (state is LodindupdatePhotoImage) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorUpdatePostState) {
          tost(text: "CheckTheNetwork???", state: ToastStae.eror);
        } else if (state is LoadingUpdateAppPhoto) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
