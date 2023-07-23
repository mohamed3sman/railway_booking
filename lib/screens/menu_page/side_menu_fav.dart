import 'package:flutter/material.dart';

class SideMenuFav extends StatelessWidget {
  const SideMenuFav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
        leading: SizedBox(
          height: 34,
          width: 34,
          child: Icon(Icons.favorite, color: Colors.white),
        ),
        title: Text(
          'Favortes',
          style: TextStyle(color: Colors.white),
        ));
  }
}
