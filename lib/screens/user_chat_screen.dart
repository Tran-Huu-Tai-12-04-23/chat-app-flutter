import 'package:flutter/material.dart';

class UserChatScreen extends StatelessWidget {
  final String userName;

  const UserChatScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeNV3FcUlXmUqx8eK-ZhL4a4VnubU94gn-Ng&s'),
            ),
            const SizedBox(width: 8),
            Text(
              userName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                _buildMessage(
                  sender: 'Bryan',
                  text: 'Looking forward to the trip.',
                  time: 'Today 8:43 AM',
                  isMe: false,
                  showAvatar: true,
                ),
                _buildMessage(
                  text: "Same! Can't wait.",
                  time: 'Today 8:43 AM',
                  isMe: true,
                ),
                _buildMessage(
                  sender: 'Bryan',
                  text: 'Antelope Canyon guide tour',
                  time: 'Today 8:43 AM',
                  imageUrl:
                      'https://smartcom.vn/blog/wp-content/uploads/2024/03/2_1.jpg',
                  isMe: false,
                  showAvatar: true,
                ),
                _buildMessage(
                  sender: 'Bryan',
                  text: 'What do you think?',
                  time: 'Today 8:43 AM',
                  isMe: false,
                  showAvatar: true,
                ),
                _buildMessage(
                  text: 'Oh yes this looks great!',
                  time: 'Today 8:43 AM',
                  isMe: true,
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessage({
    String? sender,
    required String text,
    required String time,
    String? imageUrl,
    required bool isMe,
    bool showAvatar = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe && showAvatar) ...[
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeNV3FcUlXmUqx8eK-ZhL4a4VnubU94gn-Ng&s'),
            ),
            const SizedBox(width: 8),
          ],
          Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: 200,
                ),
                decoration: BoxDecoration(
                  color:
                      isMe ? const Color(0xFF4285F4) : const Color(0xFFF1F0F0),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (imageUrl != null) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                    Text(
                      text,
                      style: TextStyle(
                        color: isMe ? Colors.white : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMe)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    time,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.add_photo_alternate_outlined),
            onPressed: () {},
            color: Colors.blue,
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {},
            color: Colors.blue,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Message',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
