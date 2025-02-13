import 'package:flutter/material.dart';

class ContactsTab extends StatelessWidget {
  const ContactsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildContactSection('A', [
                _ContactItem(
                  name: 'Alicia',
                  imageUrl: 'https://i.pravatar.cc/150?img=1',
                ),
                _ContactItem(
                  name: 'Anthony',
                  imageUrl: 'https://i.pravatar.cc/150?img=2',
                ),
              ]),
              _buildContactSection('B', [
                _ContactItem(
                  name: 'Ben',
                  imageUrl: 'https://i.pravatar.cc/150?img=3',
                ),
                _ContactItem(
                  name: 'Bryan',
                  imageUrl: 'https://i.pravatar.cc/150?img=4',
                ),
                _ContactItem(
                  name: 'Brianna',
                  imageUrl: 'https://i.pravatar.cc/150?img=5',
                ),
              ]),
              _buildContactSection('C', [
                _ContactItem(
                  name: 'Cindy',
                  imageUrl: 'https://i.pravatar.cc/150?img=6',
                ),
              ]),
              _buildContactSection('D', [
                _ContactItem(
                  name: 'Daisy',
                  imageUrl: 'https://i.pravatar.cc/150?img=7',
                ),
                _ContactItem(
                  name: 'Diana',
                  imageUrl: 'https://i.pravatar.cc/150?img=8',
                ),
              ]),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(String letter, List<_ContactItem> contacts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            letter,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        ...contacts.map((contact) => _buildContactTile(contact)),
      ],
    );
  }

  Widget _buildContactTile(_ContactItem contact) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(contact.imageUrl),
        radius: 20,
      ),
      title: Text(
        contact.name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        // Handle contact tap
      },
    );
  }
}

class _ContactItem {
  final String name;
  final String imageUrl;

  _ContactItem({
    required this.name,
    required this.imageUrl,
  });
}
