import 'package:chat_app/screens/search_screen.dart';
import 'package:chat_app/screens/tabs/chat_tab.dart';
import 'package:chat_app/screens/tabs/contacts_tab.dart';
import 'package:chat_app/screens/tabs/setting_tab.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Text(
                    'Search',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat), text: 'Chats'),
              Tab(icon: Icon(Icons.people), text: 'Contacts'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        body: TabBarView(
          children: [
            ChatTab(),
            ContactsTab(),
            SettingsTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: const Icon(Icons.edit, color: Colors.blue),
        ),
      ),
    );
  }
}
