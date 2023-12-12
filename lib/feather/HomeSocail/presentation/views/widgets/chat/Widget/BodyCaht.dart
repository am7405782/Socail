import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Model/SocailModel.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/chat/Widget/ChatDeatiles.dart';

InkWell chatItemas(BuildContext context, [SocailModel? user]) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => chatDeatiles(user),
          ));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage("${user?.image}"),
            radius: 25,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            "${user?.name}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}
