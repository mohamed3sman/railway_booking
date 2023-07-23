import 'package:flutter/material.dart';

import 'constants.dart';

class TextFieldLabel extends StatelessWidget {
  const TextFieldLabel({super.key, required this.labelText});
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: TextStyle(
          color: kSecondaryColor, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
