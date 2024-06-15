import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@RoutePage()
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
                      Supabase.instance.client.auth.signOut();
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

class UserHeader extends StatefulWidget {
  @override
  State<UserHeader> createState() => _UserHeaderState();
}

class _UserHeaderState extends State<UserHeader> {
  final _supabase = Supabase.instance.client;

  String _firstName = '';

  String _lastName = '';

  String _email = '';

  String _avatarUrl = '';

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final user = _supabase.auth.currentUser;
    if (user != null) {
      final profilesResponse = await _supabase
          .from('profiles')
          .select('first_name, second_name, avatar_url')
          .eq('id', user.id)
          .single();

      setState(() {
        _firstName = profilesResponse['first_name'] ?? "";
        _lastName = profilesResponse['second_name'] ?? "";
        _avatarUrl = profilesResponse['avatar_url'] ?? "";
        _email = user.email.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(_avatarUrl),
        ),
        SizedBox(height: 20),
        Text(
          '$_firstName $_lastName',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 10),
        Text(
          _email,
          style: TextStyle(fontSize: 18),
        ),
      ],
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
