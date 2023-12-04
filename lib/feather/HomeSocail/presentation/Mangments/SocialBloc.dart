import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Model/SocailModel.dart';
import 'package:flutter_application_2/core/Model/postModel.dart';
import 'package:flutter_application_2/core/shard/Local/Shardprfrence.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocailState.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/chat/Chat.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/feeds/Feeds.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/setting/Setting.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/user/User.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SocailBloc extends Cubit<SocailState> {
  SocailBloc() : super(InitalState());
  static SocailBloc get(context) => BlocProvider.of(context);

  int currentindex = 0;
  List<String> title = [
    "Home",
    "Chat",
    "User",
    "profail",
  ];
  List<Widget> views = [
    const Feeds(),
    const ChatScreen(),
    const UserScreen(),
    const SettingScreen(),
  ];
  void changeBootomSheet(int index) {
    currentindex = index;
    emit(ChangeBottonSheet());
  }

  var uid = CacheHealper.getData(key: "uid");

  SocailModel? usermodel;
  void getUserData() {
    emit(GetUserDataLoding());
    FirebaseFirestore.instance.collection('user').doc(uid).get().then((value) {
      if (value.exists) {
        Map<String, dynamic>? data = value.data();
        if (data != null) {
          usermodel = SocailModel.fromJson(data);
          emit(GetUserDataScafull());
        } else {
          emit(HomeerrorState("Data is null"));
        }
      } else {
        emit(HomeerrorState("Document does not exist"));
      }
    }).catchError((e) {
      emit(GetDataerror(e));
    });
  }

  File? image;
  ImagePicker picker = ImagePicker();

  Future<void> getImageProfail() async {
    emit(LodingImageProfailState());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);

      emit(ScafullImageProfailState());
    } else {
      print('No image selected.');
      emit(ErorrImageProfailState());
    }
  }

  void uploadprofialImage({
    @required String? name,
    @required String? phone,
    @required String? bio,
  }) {
    emit(LodingUploadImageProfailState());
    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(image!.path).pathSegments.last}")
        .putFile(image!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(ScafullUploadImageProfailState());
        print(value);
        udateUserData(
          name: name!,
          phone: phone!,
          bio: bio!,
          image: value,
        );
      }).catchError((e) {
        emit(ErrorUploadImageProfailState());
      });
    }).catchError((e) {
      emit(ErrorUploadImageProfailState());
    });
  }

  File? cover;

  Future<void> getCover() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      cover = File(pickedFile.path);
      emit(ScafullImagecoverState());
    } else {
      emit(ErorrImagecoverState());
    }
  }

  void uploadCoverImage({
    @required String? name,
    @required String? phone,
    @required String? bio,
  }) {
    emit(LodingUploadImageProfailState());
    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(cover!.path).pathSegments.last}")
        .putFile(cover!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(ScafullUploadImageProfailState());
        print(value);
        udateUserData(
          name: name!,
          phone: phone!,
          bio: bio!,
          cover: value,
        );
      }).catchError((e) {
        emit(ErrorUploadImageProfailState());
      });
    }).catchError((e) {
      emit(ErrorUploadImageProfailState());
    });
  }

  void udateUserData({
    required String name,
    required String phone,
    required String bio,
    String? image,
    String? cover,
  }) {
    emit(UdateUserDataLoding());
    SocailModel model = SocailModel(
      bio: bio,
      email: usermodel?.email,
      cover: cover ?? usermodel?.cover,
      image: image ?? usermodel?.image,
      name: name,
      phone: phone,
      uid: usermodel?.uid,
    );
    FirebaseFirestore.instance
        .collection("user")
        .doc(usermodel?.uid)
        .update(model.toMap())
        .then((value) {
      getUserData();
      emit(UdateUserDataScafull());
    }).catchError((eror) {
      emit(UdateUserDataEror());
      print(eror.toString());
    });
  }

  File? postimage;

  Future<void> getpostProfail() async {
    emit(LodinggetPostImageState());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postimage = File(pickedFile.path);

      emit(ScafullgetPostImageState());
    } else {
      print('No image selected.');
      emit(ErrorgetPostImageState());
    }
  }

  void uploadpostImageImage({
    required String text,
    required String date,
    required String? postImage,
  }) {
    emit(LodingUploadPostImageState());
    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(postimage!.path).pathSegments.last}")
        .putFile(postimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        creatPost(
          datetime: date,
          text: text,
          postImge: value,
        );
        emit(ScafullUploadPostImageState());
      }).catchError((e) {
        emit(ErrorUploadImageProfailState());
      });
    }).catchError((e) {
      emit(ErrorUploadImageProfailState());
    });
  }

  void creatPost({
    required String text,
    required String datetime,
    String? postImge,
  }) {
    emit(LodingCreatPostState());
    PostModel postModel = PostModel(
      dateTime: datetime,
      name: usermodel?.name,
      text: text,
      uId: usermodel?.uid,
      image: usermodel?.image,
      postImage: postImge ?? "",
    );
    FirebaseFirestore.instance
        .collection("post")
        .add(postModel.toMap())
        .then((value) {
      emit(ScafullCreatPoststate());
    }).catchError((eror) {
      emit(ErorrCreatPostState());
    });
  }
}
