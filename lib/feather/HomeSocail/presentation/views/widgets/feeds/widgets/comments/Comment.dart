import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Model/CommentModel.dart';
import 'package:flutter_application_2/core/Model/postModel.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocailState.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Comment extends StatelessWidget {
  const Comment(
      {super.key,
      required this.post,
      required this.index,
      required this.postid});
  final PostModel post;
  final int index;
  final String postid;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var commentController = TextEditingController();
    return BlocProvider(
      create: (context) =>
          SocailBloc()..getComments(SocailBloc.get(context).postId[index]),
      child: BlocConsumer<SocailBloc, SocailState>(
        listener: (context, state) {
          // if (state is ScafullSendCommentState) {
          //   SocailBloc.get(context)
          //       .getComments(SocailBloc.get(context).postId[index]);
          // }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  const Text(
                    "comments",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  const Divider(height: 20, thickness: 0.5, color: Colors.grey),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => builscomment(
                        SocailBloc.get(context).comments[index],
                      ),
                      itemCount: SocailBloc.get(context).comments.length,
                      separatorBuilder: (context, index) => Divider(
                          height: 20, thickness: 0.5, color: Colors.grey[300]),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  textformComment(commentController, context),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                ],
              ),
            )),
          );
        },
      ),
    );
  }

  TextFormField textformComment(
      TextEditingController commentController, BuildContext context) {
    return TextFormField(
      controller: commentController,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            SocailBloc.get(context).addComments(
                image: post.image!,
                name: post.name!,
                postid: postid,
                text: commentController.text,
                dateTime: DateTime.now().toString());
            commentController.clear();
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
    );
  }

  builscomment(CommentModel? comment) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(15),
            bottomStart: Radius.circular(15),
            topEnd: Radius.circular(15),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  '${comment?.image}',
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${comment?.name}',
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${comment?.dateTime?.substring(0, 10)}',
                    style: const TextStyle(
                      color: Colors.black26,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 36),
            child: Text(
              '${comment?.text}',
              style: const TextStyle(
                  color: Colors.black54,
                  height: 1.3,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
