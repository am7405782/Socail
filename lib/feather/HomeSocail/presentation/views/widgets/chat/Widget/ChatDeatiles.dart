import 'package:flutter/material.dart';

class ChatDeatiles extends StatelessWidget {
  const ChatDeatiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/one.jpg",
              ),
              radius: 20,
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
              "AhmedMohmed",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(10),
                    topEnd: Radius.circular(10),
                    bottomStart: Radius.circular(10),
                  ),
                ),
                child: const Text(
                  "Heloo Ahmed",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(10),
                    bottomStart: Radius.circular(10),
                    topStart: Radius.circular(10),
                  ),
                ),
                child: const Text(
                  "Heloo Ahmed",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ),
            ),
            Spacer(),
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                ),
                hintText: "message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
