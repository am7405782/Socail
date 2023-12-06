import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/feeds/widgets/Postitems.dart';

class ListViewFeeds extends StatelessWidget {
  const ListViewFeeds({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => buildPostItems(
              SocailBloc.get(context).posts[index],
              context,
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
        itemCount: SocailBloc.get(context).posts.length);
  }
}
