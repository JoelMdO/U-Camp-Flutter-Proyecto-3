import 'dart:core';
import 'package:flutter/material.dart';

import 'package:ucamp_project_3_travel_app/app/widgets/appbar.dart';
import 'package:ucamp_project_3_travel_app/app/widgets/bottom_navigation_bar.dart';
import 'package:ucamp_project_3_travel_app/presentation/pages/menu.dart';
import 'package:intl/intl.dart';

class Formato extends StatefulWidget {
  const Formato({Key? key}) : super(key: key);

  @override
  State<Formato> createState() => _FormatoState();
}

class _FormatoState extends State<Formato> {
//KEY TO INDENTIFY AND ALLOWS VALIDATION OF THE FORM
  final _formKey = GlobalKey<FormState>();

//DATA TO PICK DESTINATION AFTER RETRIEVE FROM PREVIOUS PAGE
  var value = 0;
  // ignore: prefer_typing_uninitialized_variables
  var _index;
  //INITIALIZE INDEX OF THE LIST
  @override
  void initState() {
    setState(() {
      if (value != 0) {
        _index = value;
      } else {
        _index = 0;
      }
    });
    super.initState();
  }

  //LIST OF IMAGES
  final List images = [
    'lib/assets/Title.png',
    'lib/assets/Title Marrakech.png',
    'lib/assets/Title Miami.png',
    'lib/assets/Title Hongkong.png',
  ];

//RANGE PICKER DETAILS
  DateTimeRange dateTimeRange = DateTimeRange(
    start: DateTime(2023, 1, 31),
    end: DateTime(2023, 12, 31),
  );
  //CREATE THE CALENDAR PICKER//
  Future calendar() async {
    final DateTimeRange? result = await showDateRangePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
              primary: Colors.orangeAccent,
              onPrimary: Colors.black,
              background: Color(0xffFAEEDD),
            )),
            child: child!,
          );
        },
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2023, 12, 31),
        currentDate: DateTime.now(),
        saveText: 'Done');

    if (result != null) {
      setState(() {
        dateTimeRange = result;
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    //VAR TO CALL THE TIME RANGE
    final start = dateTimeRange.start;
    final end = dateTimeRange.end;
    final duration = dateTimeRange.duration;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(35), child: AppBarGeneral()),
      body: SafeArea(
          top: true,
          bottom: true,
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
//TITLE//
                      const Padding(
                          padding: EdgeInsets.only(
                            top: 15,
                            left: 10,
                          ),
                          child: Text(
                            'Selected \nDestination:',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w800),
                          )),
//DESTINATION PICTURE//
                      Padding(
                          padding: const EdgeInsets.only(top: 20, left: 100),
                          child: Image.asset(
                            images[_index],
                            width: 250,
                          )),
//GUEST TEXTFIELD//
                      Padding(
                          padding: const EdgeInsets.only(top: 20, left: 15),
                          child: SizedBox(
                              width: 350,
                              height: 95,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Guest Name:',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800)),
                                    TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor: const Color(0xffD9D9D9)
                                              .withOpacity(0.25),
                                          hintText: 'Type your full name',
                                        ),
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) {
                                          if (value.isEmpty) {
                                            const Text(
                                                'Please write your name');
                                          }
                                          if (value.contains(
                                              RegExp(r'^[a-zA-Z]+$'))) {
                                          } else {
                                            const Text(
                                                'Please write a valid name');
                                          }
                                        }),
                                  ]))),
//EMAIL TEXTFIELD//
                      Padding(
                          padding: const EdgeInsets.only(top: 10, left: 15),
                          child: SizedBox(
                              width: 350,
                              height: 95,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('E-mail:',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800)),
                                    TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor: const Color(0xffD9D9D9)
                                              .withOpacity(0.25),
                                          hintText: 'Type your email',
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onChanged: (value) {
                                          if (value.isEmpty) {
                                            const Text(
                                                'Please enter your email');
                                          }
                                          if (value.contains(RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                                          } else {
                                            const Text(
                                                'Please write a valid email');
                                          }
                                        }),
                                  ]))),
//PERIOD OF STAY//
                      Padding(
                          padding: const EdgeInsets.only(left: 15, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Period of stay:',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800)),
                              IconButton(
                                iconSize: 80,
                                icon: Image.asset(
                                  'lib/assets/Calendar2.png',
                                  width: 90,
                                  height: 90,
                                ),
                                onPressed: calendar,
                              )
                            ],
                          )),
//BUTTONS//
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 160,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
//NON BOOKING BUTTON//
                              TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      side: const BorderSide(
                                          color: Color(0xff880B0B),
                                          width: 2.0)),
                                  onPressed: (() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Menu()),
                                    );
                                  }),
                                  child: const Text(
                                    'Go back & Explore',
                                    style: TextStyle(color: Colors.black38),
                                  )),

                              ///BOOKING BUTTON//
                              Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xffDB4A1A),
                                          side: const BorderSide(
                                              color: Color(0xff880B0B),
                                              width: 2.0)),
                                      onPressed: (() {
                                        showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                    title: const Text(
                                                        'Booking Confirmed',
                                                        style: TextStyle(
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 20,
                                                        )),
                                                    content: Text(
                                                      // 'Thanks for staying with us\n Period: ${_dateTimeRange?.start.toString()} to ${_dateTimeRange?.start.toLocal()}',
                                                      'Period: ${start.day} to ${end.day}'
                                                      '${DateFormat('MMM').format(end)}\nTotal: ${duration.inDays} days\n\n Thanks for staying with us.',
                                                      style: const TextStyle(
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        style: TextButton.styleFrom(
                                                            backgroundColor:
                                                                const Color(
                                                                    0xff703232)),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                          'Close',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      )
                                                    ]));
                                      }),
                                      child: const Text(
                                        'Submit',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                            ],
                          )),
                    ]),
              ))),
//BOTTOM NAVIGAION BAR//
      bottomNavigationBar: BottomNavigationBarGeneral(),
    );
  }
}
