// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ucamp_project_3_travel_app/app/widgets/appbar.dart';
import 'package:ucamp_project_3_travel_app/app/widgets/bottom_navigation_bar.dart';
// import 'package:ucamp_project_3_travel_app/presentation/pages/maldives.dart';
// import 'package:ucamp_project_3_travel_app/presentation/pages/marakech.dart';
// import 'package:ucamp_project_3_travel_app/presentation/pages/miami.dart';
// import 'package:ucamp_project_3_travel_app/presentation/pages/hongkong.dart';
import 'package:ucamp_project_3_travel_app/presentation/widgets/beach.dart';
import 'package:ucamp_project_3_travel_app/presentation/widgets/cultural.dart';
import 'package:ucamp_project_3_travel_app/presentation/widgets/family.dart';
import 'package:ucamp_project_3_travel_app/presentation/widgets/sports.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
//APP BAR//
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(35), child: AppBarGeneral()),
        body: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: screenHeight * 0.9,
            width: screenWidth,
            child: ListView(shrinkWrap: true, children: const <Widget>[
              //BEACH SECTION//
              Beach(),
              Cultural(),
              Sports(),
              Family(),
            ]),
          ),
        ),

//BOTTOM NAVIGATION BAR//
        bottomNavigationBar:
            SizedBox(height: 35, child: BottomNavigationBarGeneral()),
      ),
    );
  }
}
