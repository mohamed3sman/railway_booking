import 'package:flutter/material.dart';

import 'constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.labelText, required this.Cnt});

  final String labelText;
  final TextEditingController Cnt;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Cnt,
      cursorColor: kPrimaryColor,
      style: const TextStyle(color: kPrimaryColor, fontSize: 18),
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: kPrimaryColor,
        ),
        labelStyle: const TextStyle(
          color: kPrimaryColor,
        ),
        labelText: labelText,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: kPrimaryColor, width: 1.2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: kPrimaryColor, width: 1.2),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: kPrimaryColor, width: 1.2),
        ),
      ),
    );
  }
}
