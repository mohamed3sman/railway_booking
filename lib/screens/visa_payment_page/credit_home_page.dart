import 'package:chat_app/screens/visa_payment_page/widgets/thanku_page.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/card_alert_dialog.dart';
import '../../components/card_input_formatter.dart';
import '../../components/card_month_input_formatter.dart';
import '../../components/master_card.dart';
import '../../components/my_painter.dart';
import '../../constants/constants.dart';

class CreditHomePage extends StatefulWidget {
  const CreditHomePage({Key? key}) : super(key: key);

  @override
  State<CreditHomePage> createState() => _CreditHomePageState();
}

class _CreditHomePageState extends State<CreditHomePage> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderNameController =
      TextEditingController();
  final TextEditingController cardExpiryDateController =
      TextEditingController();
  final TextEditingController cardCvvController = TextEditingController();

  final FlipCardController flipCardController = FlipCardController();


 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _validateForm() {
    if (_formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Card Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              FlipCard(
                  fill: Fill.fillFront,
                  direction: FlipDirection.HORIZONTAL,
                  controller: flipCardController,
                  onFlip: () {
                    print('Flip');
                  },
                  flipOnTouch: false,
                  onFlipDone: (isFront) {
                    print('isFront: $isFront');
                  },
                  front: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: buildCreditCard(
                      color: kDarkBlue,
                      cardExpiration: cardExpiryDateController.text.isEmpty
                          ? "08/2025"
                          : cardExpiryDateController.text,
                      cardHolder: cardHolderNameController.text.isEmpty
                          ? "Card Holder"
                          : cardHolderNameController.text.toUpperCase(),
                      cardNumber: cardNumberController.text.isEmpty
                          ? "XXXX XXXX XXXX XXXX"
                          : cardNumberController.text,
                    ),
                  ),
                  back: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 4.0,
                      color: kDarkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Container(
                        height: 230,
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, bottom: 22.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 0),
                            const Text(
                              'https://www.paypal.com',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 11,
                              ),
                            ),
                            Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 1.2,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            CustomPaint(
                              painter: MyPainter(),
                              child: SizedBox(
                                height: 35,
                                width: MediaQuery.of(context).size.width / 1.2,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      cardCvvController.text.isEmpty
                                          ? "322"
                                          : cardCvvController.text,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 21,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 40),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: cardNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.credit_card,
                        color: kPrimaryColor,
                      ),
                      label: Text(
                        'Card Number',
                        style: TextStyle(color: kPrimaryColor, fontSize: 18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
                      ),
                      hintStyle:
                          TextStyle(color: kPrimaryColor) //label text of field
                      ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                    CardInputFormatter(),
                  ],
                   validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid card number';
                        }
                        return null;
                      },
                  onChanged: (value) {
                    var text = value.replaceAll(RegExp(r'\s+\b|\b\s'), ' ');
                    setState(() {
                      cardNumberController.value = cardNumberController.value
                          .copyWith(
                              text: text,
                              selection:
                                  TextSelection.collapsed(offset: text.length),
                              composing: TextRange.empty);
                    });
                  },
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: cardHolderNameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                      label: Text(
                        'Full Name',
                        style: TextStyle(color: kPrimaryColor, fontSize: 18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
                      ),
                      hintStyle:
                          TextStyle(color: kPrimaryColor) //label text of field
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid Full Name';
                        }
                        return null;
                      },
                  onChanged: (value) {
                    setState(() {
                      cardHolderNameController.value =
                          cardHolderNameController.value.copyWith(
                              text: value,
                              selection:
                                  TextSelection.collapsed(offset: value.length),
                              composing: TextRange.empty);
                    });
                  },
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width / 2.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: cardExpiryDateController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: kPrimaryColor,
                          ),
                          label: Text(
                            'MM/YY',
                            style: TextStyle(color: kPrimaryColor, fontSize: 18),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1.5),
                          ),
                          hintStyle: TextStyle(
                              color: kPrimaryColor) //label text of field
                          ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                        CardDateInputFormatter(),
                      ],
                       validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid MM/YY';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        var text = value.replaceAll(RegExp(r'\s+\b|\b\s'), ' ');
                        setState(() {
                          cardExpiryDateController.value =
                              cardExpiryDateController.value.copyWith(
                                  text: text,
                                  selection: TextSelection.collapsed(
                                      offset: text.length),
                                  composing: TextRange.empty);
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 14),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width / 2.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: cardCvvController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: kPrimaryColor,
                          ),
                          label: Text(
                            'CVV',
                            style: TextStyle(color: kPrimaryColor, fontSize: 18),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: kPrimaryColor, width: 1.5),
                          ),
                          hintStyle: TextStyle(
                              color: kPrimaryColor) //label text of field
                          ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                       validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid SVV';
                        }
                        return null;
                      },
                      onTap: () {
                        setState(() {
                          Future.delayed(const Duration(milliseconds: 300), () {
                            flipCardController.toggleCard();
                          });
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          int length = value.length;
                          if (length == 4 || length == 9 || length == 14) {
                            cardNumberController.text = '$value ';
                            cardNumberController.selection =
                                TextSelection.fromPosition(
                                    TextPosition(offset: value.length + 1));
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20 * 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.symmetric(vertical: 17),
                  color: kPrimaryColor,
                  textColor: Colors.white,
                  minWidth: double.infinity,
                  onPressed: () {
                     if (_validateForm()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ThankYouPage(title: 'MMMM');
                    }));
                     }
                  },
                  child: Text(
                    'Add Card'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
