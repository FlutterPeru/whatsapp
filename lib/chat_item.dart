import 'package:whatsapp/User.dart';

class ChatItem {
  User user;
  String message;
  DateTime date;
  ChatStatus status;
  int unreadCount;

  ChatItem({
    this.user,
    this.message,
    this.date,
    this.status = ChatStatus.VISTO,
    int unreadCount,
  }) : unreadCount = unreadCount ?? 0;

  bool get unread => unreadCount > 0;

  factory ChatItem.fromJson(Map<String, dynamic> json) {
    User user = User(name: json["username"], avatarUrl: json["avatarUrl"]);
    return ChatItem(
      user: user,
      message: json["message"],
      date: json["date"],
      unreadCount: json["unreadCount"] ,
    );

  }
}

enum ChatStatus { SENDING, SENT, RECEIVED, CHECKED, VISTO }
