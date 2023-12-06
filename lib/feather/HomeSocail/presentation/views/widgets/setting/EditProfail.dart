import 'package:flutter/material.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocailState.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocialBloc.dart';
import 'package:flutter_application_2/feather/Login/presentation/views/widgets/customButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfail extends StatefulWidget {
  const EditProfail({super.key});

  @override
  State<EditProfail> createState() => _EditProfailState();
}

class _EditProfailState extends State<EditProfail> {
  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<SocailBloc, SocailState>(
      listener: (context, state) {
        if (state is UdateUserDataLoding) {
          const CircularProgressIndicator();
        }
      },
      builder: (context, state) {
        var usermodel = SocailBloc.get(context).usermodel;
        var imageProfail = SocailBloc.get(context).image;
        var imagecover = SocailBloc.get(context).cover;
        nameController.text = "${usermodel?.name}";
        phoneController.text = "${usermodel?.phone}";
        bioController.text = "${usermodel?.bio}";

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
                                    fit: BoxFit.cover,
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
                          child: Column(
                            children: [
                              customButton(
                                  text: "image",
                                  height: 40,
                                  onTap: () {
                                    SocailBloc.get(context).uploadprofialImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text,
                                    );
                                  }),
                              const SizedBox(
                                width: 2,
                              ),
                              if (state is LodingUploadImageProfailState)
                                const LinearProgressIndicator(),
                            ],
                          ),
                        ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (SocailBloc.get(context).cover != null)
                        Expanded(
                          child: Column(
                            children: [
                              customButton(
                                  text: "cover",
                                  height: 40,
                                  onTap: () {
                                    SocailBloc.get(context).uploadCoverImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text,
                                    );
                                  }),
                              const SizedBox(
                                width: 2,
                              ),
                              if (state is LodingUploadcoverProfailState)
                                const LinearProgressIndicator(),
                            ],
                          ),
                        ),
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onSaved: (value) {
                    nameController.text == value;
                  },
                  textCapitalization: TextCapitalization.sentences,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Pleas enter name';
                    }
                    return null;
                  },
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
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "${usermodel?.bio}",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.notes_outlined),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Pleas enter bio';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onFieldSubmitted: (value) {
                    bioController.text == value;
                  },
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
                const SizedBox(
                  height: 20,
                ),
                customButton(
                    text: "SignOut",
                    height: 40,
                    onTap: () {
                      SocailBloc.get(context).singnout();
                    }),
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
