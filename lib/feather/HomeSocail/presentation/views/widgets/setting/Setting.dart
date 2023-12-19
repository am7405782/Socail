import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Constant.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocailState.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/setting/widgets/EditProfail.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/setting/NewPhotoPost.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/setting/buildPostItemsphoto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<SocailBloc, SocailState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = SocailBloc.get(context).usermodel;
        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Card(
                      clipBehavior: Clip.none,
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      elevation: 0.0,
                      child: Container(
                        height: size.height * 0.23,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                "${model?.cover}",
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -50,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 4, color: Colors.white),
                            color: Colors.white),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "${model?.image}",
                          ),
                          radius: 48,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "${model?.name}",
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "${model?.bio}",
                  style: const TextStyle(
                      color: Colors.black38,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${SocailBloc.get(context).poto.length}",
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                          ),
                          const Text(
                            "post",
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            "10K",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Flowers",
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            "50",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Flowing",
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                            onPressed: () {
                              navigatTo(
                                context: context,
                                navig: const NewPhotoPost(),
                              );
                            },
                            child: const Text(
                              "AddPhoto",
                            )),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      OutlinedButton(
                          onPressed: () {
                            navigatTo(
                              context: context,
                              navig: const EditProfail(),
                            );
                          },
                          child: const Icon(
                            Icons.mode_edit_outline_rounded,
                            size: 18,
                          )),
                    ],
                  ),
                ),
                if (SocailBloc.get(context).poto.isNotEmpty)
                  listAddpohto(context),
                if (SocailBloc.get(context).poto.isEmpty)
                  const Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        );
      },
    );
  }

  ListView listAddpohto(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) =>
          buildPohtoItems(context, index, SocailBloc.get(context).poto[index]),
      itemCount: SocailBloc.get(context).poto.length,
    );
  }
}
