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
}

enum ChatStatus { SENDING, SENT, RECEIVED, CHECKED, VISTO }
