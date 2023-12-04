import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocailState.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_application_2/feather/Login/presentation/views/widgets/customButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfail extends StatelessWidget {
  const EditProfail({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var model = SocailBloc.get(context).usermodel;
    var nameController = TextEditingController();
    var bioController = TextEditingController();
    var phoneController = TextEditingController();
    nameController.text = "${model?.name}";
    phoneController.text = "${model?.phone}";
    bioController.text = "${model?.bio}";
    return BlocConsumer<SocailBloc, SocailState>(
      listener: (context, state) {
        if (state is UdateUserDataScafull) {
          const CircularProgressIndicator();
        }
      },
      builder: (context, state) {
        var usermodel = SocailBloc.get(context).usermodel;
        var imageProfail = SocailBloc.get(context).image;
        var imagecover = SocailBloc.get(context).cover;

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
              ),
            ),
            title: const Text(
              "EditProfail",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  SocailBloc.get(context).udateUserData(
                    name: nameController.text,
                    phone: phoneController.text,
                    bio: bioController.text,
                  );
                },
                child: const Text(
                  "Updat",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
            ],
          ),
          body: SingleChildScrollView(
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
                      child: InkWell(
                        onTap: () {
                          SocailBloc.get(context).getCover();
                        },
                        child: Container(
                          height: size.height * 0.23,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: imagecover == null
                                ? DecorationImage(
                                    image: NetworkImage(
                                      "${usermodel?.cover}",
                                    ),
                                    fit: BoxFit.cover)
                                : DecorationImage(
                                    image: FileImage(imagecover),
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -50,
                      child: InkWell(
                        onTap: () {
                          SocailBloc.get(context).getImageProfail();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(width: 4, color: Colors.white),
                              color: Colors.white),
                          child: CircleAvatar(
                            backgroundImage: imageProfail == null
                                ? NetworkImage(
                                    "${usermodel?.image}",
                                  )
                                : FileImage(imageProfail) as ImageProvider,
                            radius: 48,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                if (SocailBloc.get(context).image != null ||
                    SocailBloc.get(context).cover != null)
                  Row(
                    children: [
                      if (SocailBloc.get(context).image != null)
                        Expanded(
                          child: customButton(
                              text: "image",
                              height: 40,
                              onTap: () {
                                SocailBloc.get(context).uploadprofialImage(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  bio: bioController.text,
                                );
                              }),
                        ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (SocailBloc.get(context).cover != null)
                        Expanded(
                          child: customButton(
                              text: "cover",
                              height: 40,
                              onTap: () {
                                SocailBloc.get(context).uploadCoverImage(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  bio: bioController.text,
                                );
                              }),
                        ),
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    prefixIcon: const Icon(
                      Icons.person_2_outlined,
                    ),
                    hintText: "${usermodel?.name}",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: bioController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    prefixIcon: const Icon(
                      Icons.menu,
                    ),
                    hintText: "${usermodel?.bio}",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    prefixIcon: const Icon(
                      Icons.phone,
                    ),
                    hintText: "${usermodel?.phone}",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
