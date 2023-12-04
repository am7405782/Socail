import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/feeds/widgets/DetailImage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Postitems extends StatelessWidget {
  const Postitems({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      elevation: 20.0,
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/one.jpg",
                ),
                radius: 25,
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "AhmedMohmed",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        CircleAvatar(
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
                      "21/7/2019",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. ",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                height: 1.2,
                textBaseline: TextBaseline.ideographic,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailImage(),
                ),
              );
            },
            child: const Hero(
              tag: 'hero-tag',
              key: ValueKey('hero-tag'),
              child: Image(
                image: AssetImage(
                  "assets/images/one.jpg",
                ),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 220,
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
                        icon: const Icon(
                          FontAwesomeIcons.heart,
                          color: Colors.red,
                        )),
                    const Text(
                      "75",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                const Spacer(),
                const Row(
                  children: [
                    Text(
                      "75",
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
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.heart,
                        color: Colors.red,
                      )),
                  const Text(
                    "Like",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  height: size.height * 0.039,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50)),
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        FontAwesomeIcons.comments,
                        color: Colors.black26,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Write Comment",
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
