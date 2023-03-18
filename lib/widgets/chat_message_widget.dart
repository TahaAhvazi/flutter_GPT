import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:realaiapp/model/chat_model.dart';

class ChatMessagesWidget extends StatelessWidget {
  final String text;
  final ChatMessagesType chatMessagesType;

  const ChatMessagesWidget({
    super.key,
    required this.text,
    required this.chatMessagesType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: chatMessagesType == ChatMessagesType.user
            ? Colors.white
            : Colors.blueAccent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      child: Row(
        children: [
          chatMessagesType == ChatMessagesType.bot
              ? Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  child: const CircleAvatar(
                    child: Icon(
                      Icons.computer_rounded,
                    ),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontFamily: 'manrope400',
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
