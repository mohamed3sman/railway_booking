import 'package:chat_app/screens/alarm/alarmhomepage.dart';
import 'package:chat_app/screens/home_page/widgets/custom_ticket_widget.dart';
import 'package:chat_app/screens/location/home_screen.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  static const String pageID = 'homePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  final pages = [
    const StationView(),
    const LocationView(),
    const AlarmView(),
    const NotificationView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        // color: Theme.of(context).primaryColor,
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? const Icon(
                        Icons.train,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.train_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'Station',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? const Icon(
                        Icons.location_on_rounded,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'Location',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? const Icon(
                        Icons.alarm_on,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.alarm_add_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'Alarm',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: pageIndex == 3
                    ? const Icon(
                        Icons.notifications_active,
                        color: Colors.white,
                        size: 35,
                      )
                    : const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 35,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'Notification',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StationView extends StatelessWidget {
  const StationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: kPrimaryColor,
              size: 30,
            )),
        title: const Text(
          'Pick a Train',
          style: TextStyle(color: kPrimaryColor, fontSize: 22),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.filter_alt,
              color: kPrimaryColor,
              size: 30,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => const CustomTicketWidget()),
      ),
    );
  }
}

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LocationHomePage();
  }
}

class AlarmView extends StatelessWidget {
  const AlarmView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlarmHomePage();
  }
}

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Notifcation",
        style: TextStyle(
          color: kPrimaryColor,
          fontSize: 45,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
