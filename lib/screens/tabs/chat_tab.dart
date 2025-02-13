import 'package:chat_app/screens/user_chat_screen.dart';
import 'package:flutter/material.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100], // Set a consistent background color
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildChatItem(
            context,
            'Bryan',
            'What do you think?',
            '4:30 PM',
            'https://i.pravatar.cc/150?img=1',
            unreadCount: 2,
          ),
          _buildChatItem(
            context,
            'Kari',
            'Looks great!',
            '4:23 PM',
            'https://i.pravatar.cc/150?img=2',
            unreadCount: 1,
          ),
          _buildChatItem(
            context,
            'Diana',
            'Lunch on Monday?',
            '4:12 PM',
            'https://i.pravatar.cc/150?img=3',
          ),
          _buildChatItem(
            context,
            'Ben',
            'You sent a photo.',
            '3:58 PM',
            'https://i.pravatar.cc/150?img=4',
          ),
          _buildChatItem(
            context,
            'Naomi',
            'Naomi sent a photo.',
            '3:31 PM',
            'https://i.pravatar.cc/150?img=5',
          ),
          _buildChatItem(
            context,
            'Alicia',
            'See you at 8.',
            '3:30 PM',
            'https://i.pravatar.cc/150?img=6',
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(
    BuildContext context,
    String name,
    String message,
    String time,
    String avatarUrl, {
    int unreadCount = 0,
  }) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: () {
          // Handle tap event here
          print('Tapped on chat with $name');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserChatScreen(userName: name),
            ),
          );
          // You can navigate to a chat detail screen or perform any other action
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            message,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (unreadCount > 0)
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              unreadCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
