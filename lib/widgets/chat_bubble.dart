import 'package:flutter/material.dart';
import 'package:projet_5/constantes.dart';
import 'package:projet_5/model/message.dart';

class Chatbubble extends StatelessWidget {
  Message message;

  Chatbubble({required this.message});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
              topRight: Radius.circular(24)),
        ),
        margin: EdgeInsets.only(left: 16, top: 10),
        padding: EdgeInsets.only(right: 24, top: 16, bottom: 16, left: 16),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ChatbubbleForFriend extends StatelessWidget {
  Message message;

  ChatbubbleForFriend({required this.message});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff006D84),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              bottomLeft: Radius.circular(24),
              topRight: Radius.circular(24)),
        ),
        margin: EdgeInsets.only(right: 16, top: 10),
        padding: EdgeInsets.only(right: 24, top: 16, bottom: 16, left: 16),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
