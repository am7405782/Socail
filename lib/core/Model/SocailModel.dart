class SocailModel {
  String? name;
  String? email;
  String? phone;
  String? uid;
  SocailModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uid,
  });
  SocailModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uid = json['uid'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uid': uid,
    };
  }
}
