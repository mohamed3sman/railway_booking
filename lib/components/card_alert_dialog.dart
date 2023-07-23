import 'package:flutter/material.dart';

class CardAlertDialog extends StatelessWidget {
  const CardAlertDialog({
    Key? key,
    required bool isValidCard,
  }) : _isValidCard = isValidCard, super(key: key);

  final bool _isValidCard;

  @override
  Widget build(BuildContext context) {
     if (!_isValidCard) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Invalid Card',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffaf4c4c),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Please provide a valid card.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      );
    }
    
    return AlertDialog(
        content: Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 80.0,
          top: -90.0,
          child: Image.asset(
            'assets/icons/checked.png',
            height: 90,
            width: 90,
          ),
        ),
        Positioned(
          right: -40.0,
          top: -40.0,
          child: InkResponse(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.close, color: Colors.white),
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Su tarjeta fue aceptada',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffaf4c4c),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Ya puedes usar tu tarjeta para hacer pagos, Gracias',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
