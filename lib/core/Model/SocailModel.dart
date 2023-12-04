class SocailModel {
  String? name;
  String? email;
  String? phone;
  String? uid;
  String? bio;
  String? image;
  String? cover;
  SocailModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uid,
    required this.bio,
    required this.image,
    required this.cover,
  });
  SocailModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uid = json['uid'];
    bio = json['bio'];
    image = json['image'];
    cover = json['cover'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uid': uid,
      'bio': bio,
      'image': image,
      'cover': cover,
    };
  }
}
