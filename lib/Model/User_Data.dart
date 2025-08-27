import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    String lastseen;
    String createdAt;
    String name;
    bool isOnline;
    String id;
    String lastMessage;

    UserData({
      required this.lastseen,
       required this.createdAt,
       required this.name,
       required this.isOnline,
       required this.id,
       required this.lastMessage
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        lastseen: json["lastseen"] ?? "",
        createdAt: json["createdAt"] ?? "",
        name: json["name"] ?? "",
        isOnline: json["isOnline"] ?? "",
        id: json["id"] ?? "",
        lastMessage: json["lastMessage"] ?? ""
    );

    Map<String, dynamic> toJson() => {
        "lastseen": lastseen,
        "createdAt": createdAt,
        "name": name,
        "isOnline": isOnline,
        "id": id,
        "lastMessage": lastMessage
    };
}
