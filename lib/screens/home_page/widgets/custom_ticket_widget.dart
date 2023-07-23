import 'package:chat_app/screens/home_page/widgets/train_ticket.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class CustomTicketWidget extends StatelessWidget {
  const CustomTicketWidget({super.key});
  static const String pageID = 'ticketWidget';

  

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings?.arguments as Map<String, dynamic>;

    final startStation = routeArgs['startStation'].toString();
    final endStation = routeArgs['endStation'].toString();
    final person = routeArgs['person'].toString();

    void NavigateTicketPage(BuildContext ctx) {
      Navigator.of(ctx).pushNamed(TrainTicketDetails.pageID, arguments: {
        'startStation': startStation,
        'endStation': endStation,
        'person': person,
      });
    }
int remainingSeats = 20; 
int numberOfPersons = int.parse(person); 

int difference = remainingSeats - numberOfPersons;

String remainingSeatsText = difference == 0 ? 'Complete' : 'Remaining Seats: $difference';




    return GestureDetector(
      onTap: () {
        void NavigateTicketPage(BuildContext ctx) {
  if (difference == 0) {
  
  } else {
    Navigator.of(ctx).pushNamed(TrainTicketDetails.pageID, arguments: {
      'startStation': startStation,
      'endStation': endStation,
      'person': person,
    });
  }
}
NavigateTicketPage(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      '${endStation} Travels',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '5 EGP',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${person} Seater A/C',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  remainingSeatsText,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color(0xfff0f1f9),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            startStation,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '2:30 PM',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          '1 hour 30 mins',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            endStation,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '4:00 PM',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
