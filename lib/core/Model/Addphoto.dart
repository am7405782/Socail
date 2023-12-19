class Addphoto {
  String? name;
  String? uId;
  String? image;
  String? postImage;
  String? dateTime;
  String? text;
  List<String>? comments; // List to store comments
  int? likes; // Number of likes

  Addphoto({
    required this.name,
    required this.text,
    required this.uId,
    required this.image,
    required this.postImage,
    required this.dateTime,
    this.comments, // Optional parameter to initialize comments
    this.likes, // Optional parameter to initialize likes
  });

  Addphoto.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    name = json['name'];
    postImage = json['postImage'];
    uId = json['uId'];
    image = json['image'];
    dateTime = json['dateTime'];
    comments = json['comments'] != null
        ? List<String>.from(json['comments'])
        : []; // Deserialize comments
    likes = json['likes'] ?? 0; // Deserialize likes
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'text': text,
      'postImage': postImage,
      'dateTime': dateTime,
      'comments': comments, // Serialize comments
      'likes': likes, // Serialize likes
    };
  }

  // Function to add a comment to the post
  void addComment(String comment) {
    if (comments == null) {
      comments = [];
    }
    comments!.add(comment);
  }

  // Function to increment likes count
  void incrementLikes() {
    likes = (likes ?? 0) + 1;
  }
}
