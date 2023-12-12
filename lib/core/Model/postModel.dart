class PostModel {
  String? name;
  String? uId;
  String? image;
  String? postImage;
  String? dateTime;
  String? text;

  PostModel({
    required this.name,
    required this.text,
    required this.uId,
    required this.image,
    required this.postImage,
    required this.dateTime,
  });
  PostModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    name = json['name'];
    postImage = json['postImage'];
    uId = json['uId'];
    image = json['image'];
    dateTime = json['dateTime'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'text': text,
      'postImage': postImage,
      'dateTime': dateTime,
    };
  }
}
