import 'package:flutter/material.dart';
import 'package:whatsapp/chat_item.dart';

class VistoWidget extends StatelessWidget {
  final ChatStatus isVisto;
  VistoWidget({this.isVisto,});

  @override
  Widget build(BuildContext context) {
    switch(isVisto){
      case ChatStatus.SENT:
      return Icon( Icons.check);
      break;
      case ChatStatus.VISTO:
        return Icon( Icons.done_all, color: Colors.blueAccent);
        break;
      case ChatStatus.RECEIVED:
        return Icon( Icons.done_all,color:Colors.grey);
        break;
      case ChatStatus.SENDING:
        return Icon( Icons.timer,color:Colors.grey);
        break;
      case ChatStatus.CHECKED:
        return Icon( Icons.done_all,color:Colors.blueAccent);
        break;
    }

  }
}
