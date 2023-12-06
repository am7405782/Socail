import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Model/postModel.dart';

Scaffold deatilsphoto(PostModel? post, BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
          )),
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              "${post?.image}",
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text("${post?.name}"),
        ],
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "${post?.postImage}",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
