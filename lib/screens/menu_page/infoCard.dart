import 'package:flutter/material.dart';

import '../../main.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.name,
    required this.email,
  });
  final String name, email;

  @override
  Widget build(BuildContext context) {
    dynamic name = ModalRoute.of(context)!.settings.arguments;
    dynamic email = ModalRoute.of(context)!.settings.arguments;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ??"Merna",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
                onTap: () {
                  MyApp.themeNotifier.value =
                      MyApp.themeNotifier.value == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                },
                child: Icon(
                  color: Colors.white,
                  Theme.of(context).brightness == Brightness.light
                      ? Icons.wb_sunny_outlined
                      : Icons.dark_mode_outlined,
                  size: 25,
                )),
          ],
        ),
      ),
    );
  }
}
