import 'package:flutter/material.dart';

class SideMenuShare extends StatelessWidget {
  const SideMenuShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
        leading: SizedBox(
          height: 34,
          width: 34,
          child: Icon(Icons.share, color: Colors.white),
        ),
        title: Text(
          'Share',
          style: TextStyle(color: Colors.white),
        ));
  }
}
