import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        WhatsYourMindWidget(),
      ]),
    );
  }
}

class WhatsYourMindWidget extends StatefulWidget {
  @override
  _WhatsYourMindWidgetState createState() => _WhatsYourMindWidgetState();
}

class _WhatsYourMindWidgetState extends State<WhatsYourMindWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    // Your profile picture or icon
                    radius: 20,
                    // Example placeholder color
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: "What's on your mind?",
                        border: InputBorder.none,
                      ),
                      maxLines: null, // Allows multiple lines
                    ),
                  ),
                ],
              ),
              Divider(height: 20, thickness: 0.5, color: Colors.grey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Additional buttons or icons can be added here
                  IconButton(
                    onPressed: () {
                      // Add functionality for this button
                    },
                    icon: Icon(Icons.photo),
                  ),
                  IconButton(
                    onPressed: () {
                      // Add functionality for this button
                    },
                    icon: Icon(Icons.video_camera_back),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
