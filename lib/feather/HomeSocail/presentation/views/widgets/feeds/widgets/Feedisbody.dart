import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/feeds/widgets/ListViewPostItemsBody.dart';

class Feedisbody extends StatelessWidget {
  const Feedisbody({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            elevation: 20.0,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.asset(
                  "assets/images/one.jpg",
                  height: size.height * 0.3,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      colors: [
                        Colors.grey.withOpacity(0.9),
                        Colors.grey.withOpacity(0.8),
                        Colors.grey.withOpacity(0.2),
                        Colors.grey.withOpacity(0.1),
                      ],
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Connect with Frinds..",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListViewFeeds(size: size),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
