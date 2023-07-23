import 'package:chat_app/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/constants.dart';
import '../../utils/custom_text_field.dart';
import '../../utils/mediaquery_sizes.dart';
import '../home_page/widgets/custom_ticket_widget.dart';
import '../home_page/widgets/train_ticket.dart';
import '../menu_page/side_menu.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static const String pageID = 'SearchPage';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController dateInput = TextEditingController();
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  final startStationCnt = TextEditingController();
  final endStationCnt = TextEditingController();
  final personCnt = TextEditingController();

  void NavigateNextPage(BuildContext ctx) {
   if (_validateInputs()) {
      Navigator.of(ctx).pushNamed(HomePage.pageID, arguments: {
        'startStation': startStationCnt.text,
        'endStation': endStationCnt.text,
        'person': personCnt.text,
      });
    }
  }
   

  bool _validateInputs() {
    if (startStationCnt.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter the start station.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }

    if (endStationCnt.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter the end station.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }

    if (dateInput.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please select a date.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }

    if (personCnt.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter the number of persons.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }

    return true;
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    dynamic name = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      drawer: const Drawer(child: SideMenu()),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              size: 28,
            ),
          ),
        ],
        title: const Text('Book a Train'),
        backgroundColor: const Color.fromARGB(255, 19, 48, 109),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 30,
                ),
              ),
              Text(
                '${name ?? "Merna"} !',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Where are you headed today?',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  TextFormField(
                    controller: startStationCnt,
                    cursorColor: kPrimaryColor,
                    style: const TextStyle(color: kPrimaryColor, fontSize: 18),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: kPrimaryColor,
                      ),
                      labelStyle: TextStyle(
                        color: kPrimaryColor,
                      ),
                      labelText: 'Start Station',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: kPrimaryColor, width: 1.2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: kPrimaryColor, width: 1.2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: kPrimaryColor, width: 1.2),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: endStationCnt,
                    cursorColor: kPrimaryColor,
                    style: const TextStyle(color: kPrimaryColor, fontSize: 18),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: kPrimaryColor,
                      ),
                      labelStyle: TextStyle(
                        color: kPrimaryColor,
                      ),
                      labelText: 'End Station',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: kPrimaryColor, width: 1.2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: kPrimaryColor, width: 1.2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: kPrimaryColor, width: 1.2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: kPrimaryColor,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextField(
                            controller: dateInput,
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1.2),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1.2),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1.2),
                                ),
                                labelText: "Enter Date",
                                labelStyle: TextStyle(
                                    color: kPrimaryColor) //label text of field
                                ),
                            readOnly: true,
                            //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  dateInput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: personCnt,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: kPrimaryColor,
                                ),
                                label: Text(
                                  'Person',
                                  style: TextStyle(
                                      color: kPrimaryColor, fontSize: 18),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1.2),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1.2),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1.2),
                                ),
                                hintStyle: TextStyle(
                                    color: kPrimaryColor) //label text of field
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              MaterialButton(
                minWidth: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  NavigateNextPage(context);
                },
                child: const Text(
                  'Find Trains',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

  

