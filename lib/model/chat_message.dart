import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String sender;
  final String text;
  final String time;

  const ChatMessage({
    super.key,
    required this.sender,
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(sender),
      subtitle: Text(text),
      trailing: Text(time),
    );
  }
}
