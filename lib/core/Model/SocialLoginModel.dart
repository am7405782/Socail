class SocialModel {
  String? name;
  String? phone;
  String? email;
  String? uId;
  String? bio;
  String? image;
  String? cover;

  bool? isEmailVerfai;
  SocialModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.uId,
    required this.image,
    required this.cover,
    required this.bio,
    required this.isEmailVerfai,
  });
  SocialModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    bio = json['bio'];
    image = json['image'];
    cover = json['cover'];

    isEmailVerfai = json['isEmailVerfai'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'bio': bio,
      'image': image,
      'cover': cover,
      'isEmailVerfai': isEmailVerfai,
    };
  }
}
