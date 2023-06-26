import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationBarGeneral extends BottomNavigationBar {
  BottomNavigationBarGeneral({super.key})
      : super(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          backgroundColor: const Color(0xffFAEEDD),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.twitter,
                  color: Colors.black,
                ),
                label: ''),
          ],
        );
}
