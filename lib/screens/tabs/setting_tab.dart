import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          // Profile Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage('https://i.pravatar.cc/150?img=8'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Daniel',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '+14844578942',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue[50],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  child: const Text(
                    'Edit',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Settings Options
          _buildSettingOption(
            icon: Icons.settings,
            title: 'General',
            onTap: () {},
          ),
          _buildSettingOption(
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () {},
          ),
          _buildSettingOption(
            icon: Icons.dark_mode,
            title: 'Appearance',
            onTap: () {},
          ),
          _buildSettingOption(
            icon: Icons.lock,
            title: 'Privacy',
            onTap: () {},
          ),
          _buildSettingOption(
            icon: Icons.cloud,
            title: 'Storage & Data',
            onTap: () {},
          ),
          _buildSettingOption(
            icon: Icons.info,
            title: 'About',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSettingOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue,
        size: 24,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
    );
  }
}
