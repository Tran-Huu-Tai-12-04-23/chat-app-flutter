import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String sender;
  final String text;
  final String time;
  final String? imageUrl;
  final bool isMe;

  const ChatMessage({
    super.key,
    required this.sender,
    required this.text,
    required this.time,
    this.imageUrl,
    this.isMe = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (imageUrl != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.network(imageUrl!),
          ),
        ListTile(
          title: Text(
            sender,
            style: TextStyle(
                fontWeight: isMe ? FontWeight.bold : FontWeight.normal),
          ),
          subtitle: Text(text),
          trailing: Text(time),
        ),
      ],
    );
  }
}
