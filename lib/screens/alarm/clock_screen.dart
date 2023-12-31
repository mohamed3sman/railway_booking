import 'package:flutter/material.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateTime.now().hour > 12 ? "Good Evening" : 'Good Morning',
              style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w700,
                  color: Colors.teal),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
                DateTime.now().hour > 12
                    ? '${DateTime.now().hour} :${DateTime.now().minute} PM '
                    : '${DateTime.now().hour} :${DateTime.now().minute} AM  ',
                style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w700,
                    color: Colors.teal)),
          ],
        ),
      ),
    );
  }
}
