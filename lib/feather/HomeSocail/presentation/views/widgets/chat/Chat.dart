import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/chat/Widget/ChatDeatiles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatDeatiles(),
                ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/one.jpg",
                  ),
                  radius: 25,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "AhmedMohmed",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Hello Ahmed",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.withOpacity(0.9),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                const Text(
                  "12:15",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) =>
            const Divider(height: 20, thickness: 0.5, color: Colors.grey),
        itemCount: 3,
      ),
    );
  }
}
