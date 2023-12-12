import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Model/postModel.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/feeds/widgets/Comment.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/feeds/widgets/DetailImage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Card buildPostItems(PostModel? post, BuildContext context, index) {
  var size = MediaQuery.of(context).size;
  return Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    elevation: 20.0,
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "${post?.image}",
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
                        "${post?.name}",
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
                  Text(
                    "${post?.dateTime}",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.ellipsis,
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              "${post?.text}",
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
                height: 1.2,
                textBaseline: TextBaseline.ideographic,
              ),
            ),
          ),
        ),
        if (post?.postImage != "")
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => deatilsphoto(post, context),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 220,
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
                  Text(
                    "${SocailBloc.get(context).Liks[index]}",
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              const Spacer(),
              const Row(
                children: [
                  Text(
                    "0",
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "comments",
                    style: TextStyle(color: Colors.black38),
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
        Row(
          children: [
            Expanded(
              child: WriteComment(
                size: size,
                post: post!,
                index: index,
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      SocailBloc.get(context)
                          .Like(SocailBloc.get(context).postId[index]);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.heart,
                      color: Colors.red,
                    )),
                const Text(
                  "Like",
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

class WriteComment extends StatelessWidget {
  const WriteComment({
    super.key,
    required this.size,
    required this.post,
    required this.index,
  });

  final Size size;
  final PostModel post;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Comment(
                post: post,
                index: index,
              ),
            ));
      },
      child: Container(
        height: size.height * 0.039,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(50)),
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage("${SocailBloc.get(context).usermodel?.image}"),
              radius: 20,
            ),
            const SizedBox(
              width: 30,
            ),
            const Text(
              "Write Comment",
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}
