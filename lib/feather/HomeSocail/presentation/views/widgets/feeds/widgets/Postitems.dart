import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Model/postModel.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/feeds/widgets/comments/Comment.dart';
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
        const SizedBox(
          height: 10,
        ),
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
                    "${post!.dateTime?.substring(0, 10)}",
                    style: const TextStyle(fontSize: 12, color: Colors.black38),
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
                } else if (value == 'remove') {}
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
                  Text(
                    "${SocailBloc.get(context).likes[index]}",
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    "${SocailBloc.get(context).comments.length}",
                    style: const TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "comment",
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
                post: post,
                index: index,
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      SocailBloc.get(context)
                          .addLike(SocailBloc.get(context).postId[index]);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.heart,
                      color: Colors.red,
                    )),
                const Text(
                  "Like",
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(
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
    required this.post,
    required this.index,
  });

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
                postid: SocailBloc.get(context).postId[index],
              ),
            ));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(30)),
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          children: [
            SizedBox(
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage("${SocailBloc.get(context).usermodel?.image}"),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              "${SocailBloc.get(context).comments.length}",
              // "Write Comment",
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}
