import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailImage extends StatelessWidget {
  const DetailImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NameImage'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          const Center(
            child: Hero(
              tag: 'NameImage',
              key: ValueKey('hero-tag'),
              child: Image(
                image: AssetImage(
                  "assets/images/one.jpg",
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
        ],
      ),
    );
  }
}
