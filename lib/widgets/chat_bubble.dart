import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatBubble extends StatelessWidget {
  ChatBubble({super.key, required this.message});
  Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        padding:
            const EdgeInsets.only(left: 16, bottom: 25, top: 25, right: 16),
        decoration: const BoxDecoration(
            color: KPrimaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ChatBubbleForFriend extends StatelessWidget {
  ChatBubbleForFriend({super.key, required this.message});
  Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        padding:
            const EdgeInsets.only(left: 16, bottom: 25, top: 25, right: 16),
        decoration: const BoxDecoration(
            color: Color(0xff006d84),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30))),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
