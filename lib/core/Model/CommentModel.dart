class CommentModel {
  String? uid;
  String? dateTime;
  String? text;
  String? postId;
  String? name;
  String? image;

  CommentModel({
    required this.uid,
    required this.dateTime,
    required this.text,
    required this.postId,
    required this.name,
    required this.image,
  });
  CommentModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    postId = json['PostId'];

    dateTime = json['dateTime'];
    text = json['text'];
    name = json['name'];
    image = json['image'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'PostId': postId,
      'dateTime': dateTime,
      'text': text,
      'name': name,
      'image': image,
    };
  }
}
