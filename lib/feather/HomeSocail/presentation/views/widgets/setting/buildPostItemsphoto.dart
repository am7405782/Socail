import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Model/postModel.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/feeds/widgets/comments/Comment.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/setting/UpdateScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Card buildPohtoItems(BuildContext context, index, PostModel? post) {
  return Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    elevation: 20.0,
    child: Column(
      children: [
        const SizedBox(
          height: 3,
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "${SocailBloc.get(context).usermodel?.image}",
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
                        "${SocailBloc.get(context).usermodel?.name}",
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${post!.dateTime?.substring(10, 16)}",
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black38),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        "${post.dateTime?.substring(0, 10)}",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'update',
                  child: Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(width: 5),
                      Text('Update'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'remove',
                  child: Row(
                    children: [
                      Icon(Icons.delete),
                      SizedBox(width: 5),
                      Text('Remove'),
                    ],
                  ),
                ),
              ],
              onSelected: (value) {
                // Handle selection here
                if (value == 'update') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateScreen(
                        documentId: SocailBloc.get(context)
                            .potoId[index], // Pass document ID
                        textPost: post.text!, // Pass text post
                        imagePost: post.postImage!, // Pass image post
                      ), // Replace UpdateScreen with your screen
                    ),
                  );
                } else if (value == 'remove') {
                  SocailBloc.get(context).deletephoto(
                    SocailBloc.get(context).potoId[index],
                  );
                }
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              "${post.text}",
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
                height: 1.2,
                textBaseline: TextBaseline.ideographic,
              ),
            ),
          ),
        ),
        if (post.postImage != "")
          InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => deatilsphoto(post, context),
              //   ),
              // );
            },
            child: Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "${post.postImage}",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        SocailBloc.get(context).icon,
                        color: Colors.grey,
                      )),
                  const Text(
                    '0',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  const Text(
                    "0",
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Comment(
                              index: index,
                              postid: SocailBloc.get(context).potoId[index],
                              post: post,
                            ),
                          ));
                    },
                    child: const Row(
                      children: [
                        Text(
                          "comments",
                          style: TextStyle(color: Colors.black38),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          FontAwesomeIcons.comment,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.black38.withOpacity(0.2),
        ),
        // Row(
        //   children: [
        //     Expanded(
        //       child: WriteComment(
        //         size: size,
        //         post: post!,
        //         index: index,
        //       ),
        //     ),
        //     Row(
        //       children: [
        //         IconButton(
        //             onPressed: () {
        //               SocailBloc.get(context)
        //                   .postLike(SocailBloc.get(context).postId[index]);
        //               print(SocailBloc.get(context).postId[index]);
        //             },
        //             icon: const Icon(
        //               FontAwesomeIcons.heart,
        //               color: Colors.red,
        //             )),
        //         const Text(
        //           "Like",
        //           style: TextStyle(color: Colors.black54),
        //         ),
        //         SizedBox(
        //           width: 5,
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ],
    ),
  );
}
