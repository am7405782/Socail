import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/Model/CommentModel.dart';
import 'package:flutter_application_2/core/Model/SocailModel.dart';
import 'package:flutter_application_2/core/Model/chatModel.dart';
import 'package:flutter_application_2/core/Model/postModel.dart';
import 'package:flutter_application_2/core/shard/Local/Shardprfrence.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/Mangments/SocailState.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/chat/Chat.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/feeds/Feeds.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/setting/Setting.dart';
import 'package:flutter_application_2/feather/HomeSocail/presentation/views/widgets/user/User.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SocailBloc extends Cubit<SocailState> {
  SocailBloc() : super(InitalState());
  static SocailBloc get(context) => BlocProvider.of(context);
  var uid = CacheHealper.getData(key: "uid");

  void singnout() async {
    await FirebaseAuth.instance.signOut();
    emit(SingnOutState());
  }

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
    if (index == 1) {
      getAllUser();
    }
    currentindex = index;
    emit(ChangeBottonSheet());
  }

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
    required String? name,
    required String? phone,
    required String? bio,
  }) {
    emit(LodingUploadcoverProfailState());
    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(cover!.path).pathSegments.last}")
        .putFile(cover!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(ScafullUploadcoverProfailState());
        print(value);
        udateUserData(
          name: name!,
          phone: phone!,
          bio: bio!,
          cover: value,
        );
      }).catchError((e) {
        emit(ErrorUploadcoverProfailState());
      });
    }).catchError((e) {
      emit(ErrorUploadcoverProfailState());
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

  File? imagepost;
  void removeImgePOst() {
    imagepost == File('');
    emit(RemovepostImage());
  }

  Future<void> getpostimage() async {
    emit(LodinggetPostImageState());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagepost = File(pickedFile.path);

      emit(ScafullgetPostImageState());
    } else {
      print('No image selected.');
      emit(ErrorgetPostImageState());
    }
  }

  void uploadpostImageImage({
    required String text,
    required String date,
    required String postImage,
  }) {
    emit(LodingUploadPostImageState());
    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(imagepost!.path).pathSegments.last}")
        .putFile(imagepost!)
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

  List<PostModel> posts = [];
  List<String> postId = [];
  List<int> Liks = [];
  List<int> Commments = [];

  // void getPost() {
  //   emit(LodingGetPostState());
  //   FirebaseFirestore.instance
  //       .collection("post")
  //       .orderBy("dateTime")
  //       .get()
  //       .then((value) {
  //     value.docs.forEach((element) {
  //       element.reference.collection("like").snapshots().listen((event) {
  //         Liks.add(event.docs.length);
  //         postId.add(element.id);
  //         posts.add(PostModel.fromJson(element.data()));
  //       });
  //     });
  //     emit(ScafullGetPostState());
  //   }).catchError((e) {
  //     emit(ErrorGetPostState());
  //     print(e.toString());
  //   });
  // }

  // void getPost() {
  //   emit(LodingGetPostState());
  //   FirebaseFirestore.instance
  //       .collection("post")
  //       .orderBy("dateTime")
  //       .snapshots()
  //       .listen((event) {
  //     event.docs.forEach((element) {
  //       element.reference.collection("like").snapshots().listen((event) {
  //         Liks.add(event.docs.length);
  //         postId.add(element.id);
  //         posts.add(PostModel.fromJson(element.data()));
  //       });
  //       element.reference.collection("comment").snapshots().listen((event) {
  //         Commments.add(event.docs.length);
  //         postId.add(element.id);
  //         posts.add(PostModel.fromJson(element.data()));
  //       });
  //     });
  //   });
  // }
  void getPost() {
    FirebaseFirestore.instance
        .collection("post")
        .orderBy("dateTime")
        .snapshots()
        .listen((QuerySnapshot<Map<String, dynamic>> event) {
      event.docs.forEach((QueryDocumentSnapshot<Map<String, dynamic>> element) {
        element.reference.collection("like").snapshots().listen((likes) {
          Liks.add(likes.docs.length);
        });
        element.reference.collection("comment").snapshots().listen((comments) {
          Commments.add(comments.docs.length);
          postId.add(element.id);
          posts.add(PostModel.fromJson(element.data()));
        });
      });
    });
  }

  List<int> like = [];
  void Like(String postId) {
    emit(LodingLikeState());

    FirebaseFirestore.instance
        .collection("post")
        .doc(postId)
        .collection("like")
        .doc(usermodel?.uid)
        .set({
      'like': true,
    }).then((value) {
      emit(ScafullLikeState());
    }).catchError((e) {
      emit(ErrorLikeState());
      print(e.toString());
    });
  }

  void sendComment({
    required String dateTime,
    required String text,
    required String postId,
    required String name,
    required String image,
  }) {
    CommentModel model = CommentModel(
      uid: usermodel?.uid,
      dateTime: dateTime,
      text: text,
      PostId: postId,
      name: name,
      image: image,
    );
    emit(LodingSendCommentState());
    FirebaseFirestore.instance
        .collection("post")
        .doc(postId)
        .collection("Comments")
        .doc(usermodel?.uid)
        .collection("comment")
        .add(model.toMap())
        .then((value) {
      emit(ScafullSendCommentState());
    }).catchError((e) {
      emit(ErrorSendCommentState());
    });
  }

  IconData icon = FontAwesomeIcons.solidHeart;

  List<SocailModel> user = [];
  void getAllUser() {
    emit(LodingGetUserDataChat());
    if (user.isEmpty) {
      FirebaseFirestore.instance.collection("user").get().then((value) {
        for (var element in value.docs) {
          if (element.data()["uid"] != usermodel?.uid) {
            user.add(SocailModel.fromJson(element.data()));
            emit(ScafullGetUserDataChat());
          }
        }
      }).catchError((e) {
        print(e.toString());
        emit(EroorGetUserDataChat());
      });
    }
  }

  void sendMessagechat({
    required String reseverId,
    required String dateTime,
    required String text,
    String? chatImge,
  }) {
    ChatModel model = ChatModel(
        senderId: uid,
        reseverId: reseverId,
        chatImage: chatImge ?? "",
        dateTime: dateTime,
        text: text);
    FirebaseFirestore.instance
        .collection("user")
        .doc(uid)
        .collection("chats")
        .doc(reseverId)
        .collection("Message")
        .add(model.toMap())
        .then((value) {
      emit(ScafullSendMessageState());
    }).catchError((e) {
      emit(ErrorSendMessageState());
    });
    FirebaseFirestore.instance
        .collection("user")
        .doc(reseverId)
        .collection("chats")
        .doc(uid)
        .collection("Message")
        .add(model.toMap())
        .then((value) {
      emit(ScafullSendMessageState());
      print(usermodel?.uid);
    }).catchError((e) {
      emit(ErrorSendMessageState());
    });
  }

  List<ChatModel> messages = [];

  void getmessages({required String resiverId}) {
    messages.clear();
    FirebaseFirestore.instance
        .collection("user")
        .doc(uid)
        .collection("chats")
        .doc(resiverId)
        .collection("Message")
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages.clear();
      event.docs.forEach((element) {
        messages.add(ChatModel.fromJson(element.data()));
      });
      emit(GetMessageScafull());
    });
  }

  File? chatimage;

  Future<void> getChatimage({
    required String text,
    required String dateTime,
    required String chatImage,
    required String reseverId,
  }) async {
    emit(LodinggetChatimageState());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      chatimage = File(pickedFile.path);

      emit(ScafulltChatimageState());
      uploadpChatImageImage(
          text: text,
          dateTime: dateTime,
          chatImage: chatImage,
          reseverId: reseverId);
    } else {
      print('No image selected.');
      emit(ErrorChatimageState());
    }
  }

  void uploadpChatImageImage({
    required String text,
    required String dateTime,
    required String chatImage,
    required String reseverId,
  }) {
    emit(LodingUploadChatImageState());
    FirebaseStorage.instance
        .ref()
        .child("user/chat/${Uri.file(chatimage!.path).pathSegments.last}")
        .putFile(chatimage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        sendMessagechat(
          dateTime: dateTime,
          reseverId: reseverId,
          text: text,
          chatImge: value,
        );
        emit(ScafullUploadChatImageState());
      }).catchError((e) {
        emit(ErorrUploadChatImageState());
      });
    }).catchError((e) {
      emit(ErorrUploadChatImageState());
    });
  }
}
