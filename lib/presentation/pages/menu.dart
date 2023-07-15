import 'package:flutter/material.dart';
import 'package:ucamp_project_3_travel_app/app/widgets/appbar.dart';
import 'package:ucamp_project_3_travel_app/app/widgets/bottom_navigation_bar.dart';
import 'package:ucamp_project_3_travel_app/presentation/widgets/section_index.dart';

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

    return Scaffold(
//APP BAR//
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(35), child: AppBarGeneral()),
      body: SafeArea(
          top: true,
          bottom: true,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: screenHeight * 0.9,
              width: screenWidth,
              child: ListView(shrinkWrap: true, children: const <Widget>[
                //MENU SECTION//
                SectionsIndex(
                    pagename: 'BEACH',
                    pagenamespanish: 'PLAYA',
                    pagegeneral: 'Adventure to take a seaplane',
                    background: 'lib/assets/BlueBack.png',
                    title: 'lib/assets/BlueTitle.png',
                    herotag: 'Hero1',
                    hero: 'lib/assets/MLE.png'),
                SectionsIndex(
                    pagename: 'CULTURE',
                    pagenamespanish: 'CULTURAL',
                    pagegeneral: 'The flavors of the Arab culture',
                    background: 'lib/assets/Brownback.png',
                    title: 'lib/assets/BrownTitle.png',
                    herotag: 'Hero2',
                    hero: 'lib/assets/RAK.png'),
                SectionsIndex(
                    pagename: 'FAMILY',
                    pagenamespanish: 'EN FAMILIA',
                    pagegeneral: 'The Far East Disneyland',
                    background: 'lib/assets/PurpleBack.png',
                    title: 'lib/assets/PurpleTitle.png',
                    herotag: 'Hero3',
                    hero: 'lib/assets/FAMILY.png'),
                SectionsIndex(
                    pagename: 'SPORTIVE',
                    pagenamespanish: 'DEPORTIVO',
                    pagegeneral: 'A city with all the sports',
                    background: 'lib/assets/GreenBack.png',
                    title: 'lib/assets/GreenTitle.png',
                    herotag: 'Hero4',
                    hero: 'lib/assets/SPORTS.png'),
              ]),
            ),
          )),

//BOTTOM NAVIGATION BAR//
      bottomNavigationBar:
          SizedBox(height: 35, child: BottomNavigationBarGeneral()),
    );
  }
}
