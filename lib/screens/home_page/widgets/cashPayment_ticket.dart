// ignore_for_file: prefer_const_constructors

import 'package:chat_app/screens/home_page/home_page.dart';
import 'package:chat_app/screens/location/home_screen.dart';
import 'package:chat_app/screens/search_page/homeScreen.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../visa_payment_page/widgets/home_button.dart';

class CashPyment extends StatefulWidget {
  const CashPyment({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CashPyment> createState() => _CashPayment();
}

Color themeColor = const Color(0xFF43D19E);

class _CashPayment extends State<CashPyment> {
  double screenWidth = 600;
  double screenHeight = 400;
  Color textColor = const Color(0xFF32567A);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
                radius: 120,
                backgroundImage: AssetImage('assets/images/cashpayment.jpg')),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "Thank You!",
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.w600,
                fontSize: 36,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "Not Payed Yet",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "You will be redirected to the home page shortly\nor click here to return to home page",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
