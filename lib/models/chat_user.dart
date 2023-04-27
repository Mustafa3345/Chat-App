class ChatUser {
  var image;

  ChatUser({
    required this.lastactive,
    required this.id,
    required this.email,
    required this.name,
    required this.isOnline,
    required this.pushToken,
    required this.about,
    required this.createAt,
    required String image,
  });
  late final String lastactive;
  late final String id;
  late final String email;
  late final String name;
  late final bool isOnline;
  late final String pushToken;
  late final String about;
  late final String createAt;

  ChatUser.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    lastactive = json['lastactive'] ?? '';
    id = json['id'] ?? '';
    email = json['email'] ?? '';
    name = json['name'] ?? '';
    isOnline = json['is_online'] ?? '';
    pushToken = json['push_token'] ?? '';
    about = json['about'] ?? '';
    createAt = json['create_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lastactive'] = lastactive;
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['is_online'] = isOnline;
    data['push_token'] = pushToken;
    data['about'] = about;
    data['create_at'] = createAt;
    return data;
  }
}
