import 'package:chat_app/screens/chat_page.dart';
import 'package:flutter/material.dart';

import '../login_page.dart';

class SideMenuHelp extends StatelessWidget {
  const SideMenuHelp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (cotext) {
          return ChatPage();
        }));
      },
      child: const ListTile(
          leading: SizedBox(
            height: 34,
            width: 34,
            child: Icon(Icons.chat, color: Colors.white),
          ),
          title: Text(
            'Help',
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
