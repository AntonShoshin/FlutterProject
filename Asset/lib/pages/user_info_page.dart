import 'package:flutter/material.dart';

import '../model/user.dart';

class UserInfoPage extends StatelessWidget {
  User userInfo;

  UserInfoPage({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User info'),
        centerTitle: true,
      ),
      body: Card(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            UserInfoTile(
              textTitle: userInfo.name,
              leadingIcon: const Icon(Icons.person),
              subtitleText: userInfo.story.isEmpty ? null : userInfo.story,
              trailingText: userInfo.country.isEmpty ? null : userInfo.country,
            ),
            if (userInfo.phone.isNotEmpty)
              UserInfoTile(
                textTitle: userInfo.phone,
                leadingIcon: const Icon(Icons.phone),
              ),
            if (userInfo.email.isNotEmpty)
              UserInfoTile(
                textTitle: userInfo.email,
                leadingIcon: const Icon(Icons.email),
              ),
          ],
        ),
      ),
    );
  }
}

class UserInfoTile extends StatelessWidget {
  String textTitle;
  Icon leadingIcon;
  String? subtitleText;
  String? trailingText;

  UserInfoTile(
      {super.key,
      required this.textTitle,
      required this.leadingIcon,
      this.subtitleText,
      this.trailingText});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        textTitle,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: subtitleText == null ? null : Text(subtitleText!),
      leading: leadingIcon,
      trailing: trailingText == null
          ? null
          : Text(trailingText!), //Text(trailingText ??= ''),
    );
  }
}
