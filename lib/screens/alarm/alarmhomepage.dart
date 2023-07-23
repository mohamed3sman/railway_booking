import 'package:chat_app/screens/alarm/stop_watch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'alarm_screen.dart';
import 'clock_screen.dart';
import 'clock_view.dart';

class AlarmHomePage extends StatefulWidget {
  const AlarmHomePage({Key? key}) : super(key: key);

  @override
  State<AlarmHomePage> createState() => _AlarmHomePageState();
}

class _AlarmHomePageState extends State<AlarmHomePage> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm:ss').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    print("Build");
    return Scaffold(
      // backgroundColor: const Color(0xFF2D2F41),
      // backgroundColor: Colors.indigo,
      body: Row(
        children: [
          Expanded(
            flex: 13,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClockScreen()),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset("assets/images/clock_icon.png"),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text('Clock',
                          style: TextStyle(
                            fontFamily: 'avenir',
                            fontSize: 14,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AlarmScreen()),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset("assets/images/alarm_icon.png"),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text('Alarm',
                          style: TextStyle(
                            fontFamily: 'avenir',
                            fontSize: 14,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StopWatchScreen()),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset("assets/images/stopwatch_icon.png"),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text('Stop Watch',
                          style: TextStyle(
                            fontFamily: 'avenir',
                            fontSize: 14,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Column(
                    children: [
                      Image.asset("assets/images/timer_icon.png"),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text('Timer',
                          style: TextStyle(
                            fontFamily: 'avenir',
                            fontSize: 14,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            // color: Colors.white70,
            width: 1,
          ),
          Expanded(
            flex: 48,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Center(
                    child: Text(
                      "Clock",
                      style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Center(
                    child: Text(
                      formattedTime,
                      style: const TextStyle(
                        fontSize: 60,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      formattedDate,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Center(
                    child: ClockView(
                      size: 230,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
