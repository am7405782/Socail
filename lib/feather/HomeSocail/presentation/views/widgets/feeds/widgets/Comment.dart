import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Model/postModel.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocailState.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Comment extends StatelessWidget {
  const Comment({super.key, required this.post, required this.index});
  final PostModel post;
  final int index;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var CommentController = TextEditingController();
    return BlocProvider(
      create: (context) => SocailBloc(),
      child: BlocConsumer<SocailBloc, SocailState>(
        listener: (context, state) {},
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
                  Text(
                    "${post.name}",
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
                      itemBuilder: (context, index) => const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(
                                  'assets/images/one.jpg',
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ahmed Mohmed",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "20/5/2020",
                                    style: TextStyle(
                                      color: Colors.black26,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 36),
                            child: Text(
                              "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using",
                              style: TextStyle(
                                color: Colors.black54,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                      itemCount: 3,
                      separatorBuilder: (context, index) => Divider(
                          height: 20, thickness: 0.5, color: Colors.grey[300]),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  TextFormField(
                    controller: CommentController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          SocailBloc.get(context).sendComment(
                            postId: SocailBloc.get(context).postId[index],
                            dateTime: DateTime.now().toString(),
                            text: CommentController.text,
                            name: post.name!,
                            image: post.image!,
                          );
                          CommentController.clear();
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

  Column buildItemsComment() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(
                'assets/images/one.jpg',
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ahmed Mohmed",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "20/5/2020",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 36),
          child: Text(
            "t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using",
            style: TextStyle(
              color: Colors.black54,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
