import 'package:chat_app/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../search_page/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String pageID = 'splashScreen';
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Lottie.asset('assets/lotties/hello.json'),
            Text(
              'Click Here to Start the app',
              style: TextStyle(color: Colors.teal, fontSize: 25),
            ),
            SizedBox(
              width: 200.0,
              height: 20,
            ),
            MaterialButton(
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              color: Colors.teal,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                'Start',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
