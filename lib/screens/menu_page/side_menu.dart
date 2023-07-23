import 'package:chat_app/screens/menu_page/side_menu_fav.dart';
import 'package:chat_app/screens/menu_page/side_menu_help.dart';
import 'package:chat_app/screens/menu_page/side_menu_like.dart';
import 'package:chat_app/screens/menu_page/side_menu_share.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'infoCard.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            children: [
              InfoCard(
                name: 'Mirna Emad',
                email: 'merna@gmail.com',
              ),
              SideMenuFav(),
              SideMenuHelp(),
              SideMenuShare(),
              SideMenuLike(),
            ],
          ),
        ),
      ),
    );
  }
}
