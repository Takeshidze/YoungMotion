import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: UserHeader(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[100],
              child: ListView(
                children: [
                  SettingsTile(
                    title: 'Понравившиеся',
                    icon: Icons.favorite,
                    onTap: () {
                      // Handle tap event
                    },
                  ),
                  SettingsTile(
                    title: 'Оплата',
                    icon: Icons.payment,
                    onTap: () {
                      // Handle tap event
                    },
                  ),
                  SettingsTile(
                    title: 'Ваши записи',
                    icon: Icons.post_add,
                    onTap: () {
                      // Handle tap event
                    },
                  ),
                  SettingsTile(
                    title: 'Настройки',
                    icon: Icons.settings,
                    onTap: () {
                      // Handle tap event
                    },
                  ),
                  SettingsTile(
                    title: 'Поддержка',
                    icon: Icons.support_agent,
                    onTap: () {
                      // Handle tap event
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'User Name',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'user@example.com',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;

  SettingsTile({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      child: ListTile(
        leading: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue[100],
          ),
          child: Icon(
            icon,
            color: Colors.blue,
            size: 24,
          ),
        ),
        title: Text(title),
        trailing: Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
