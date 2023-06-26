import 'package:flutter/material.dart';
import 'package:ucamp_project_3_travel_app/presentation/pages/menu.dart';

class AppBarGeneral extends AppBar {
  AppBarGeneral({super.key})
      : super(
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                icon: const Icon(Icons.menu, color: Colors.black, size: 15),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Menu()));
                });
          }),
          backgroundColor: const Color(0xffFAEEDD),
          title: //TEXT//
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Areas of Interest',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  )),
          actions: <Widget>[
//ICON EMAIL//
            Builder(builder: (BuildContext context) {
              return IconButton(
                  onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                            title: const Text('e-mail:',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                )),
                            content: const Text(
                              'travel@officejoe.com',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xff703232)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Close',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ]),
                      ),
                  icon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ));
            }),
//ICON PHONE///
            Builder(builder: (BuildContext context) {
              return IconButton(
                  onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                            title: const Text('phone:',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                )),
                            content: const Text(
                              '+55021236',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xff703232)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Close',
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ]),
                      ),
                  icon: const Icon(
                    Icons.phone,
                    color: Colors.black,
                  ));
            }),
          ],
        );
}
