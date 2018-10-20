import 'package:flutter/material.dart';
import 'package:whatsapp/VistoWidget.dart';
import 'package:whatsapp/chat_item.dart';

class ChatItemWidget extends StatefulWidget {
  final ChatItem chatItem;
  final GestureTapCallback onTap;
  final GestureLongPressCallback onLongPress;
  ChatItemWidget({this.chatItem,this.onLongPress, this.onTap}) : assert(chatItem != null);

  @override
  ChatItemWidgetState createState() {
    return new ChatItemWidgetState();
  }
}

class ChatItemWidgetState extends State<ChatItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        backgroundImage: NetworkImage(widget.chatItem.user.avatarUrl),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.chatItem.user.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            widget.chatItem.date.toIso8601String(),
            style: TextStyle(
                color: widget.chatItem.unread ? Colors.green : Colors.grey),
          )
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              VistoWidget(isVisto: widget.chatItem.status),
              Text(widget.chatItem.message),
            ],
          ),
          widget.chatItem.unread
              ? Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  child: Text(widget.chatItem.unreadCount.toString(),style: TextStyle(color:Colors.white),))
              : Container(),
        ],
      ),
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
    );
  }
}
