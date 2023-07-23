import 'package:flutter/material.dart';

class SideMenuLike extends StatelessWidget {
  const SideMenuLike({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
        leading: SizedBox(
          height: 34,
          width: 34,
          child: Icon(Icons.star, color: Colors.white),
        ),
        title: Text(
          'Evaluate the app',
          style: TextStyle(color: Colors.white),
        ));
  }
}
