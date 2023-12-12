class ChatModel {
  String? senderId;
  String? reseverId;
  String? chatImage;
  String? dateTime;
  String? text;

  ChatModel({
    required this.senderId,
    required this.reseverId,
    required this.chatImage,
    required this.dateTime,
    required this.text,
  });
  ChatModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    reseverId = json['reseverId'];
    chatImage = json['chatImage'];
    dateTime = json['dateTime'];
    text = json['text'];
  }
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'reseverId': reseverId,
      'chatImage': chatImage,
      'dateTime': dateTime,
      'text': text,
    };
  }
}
