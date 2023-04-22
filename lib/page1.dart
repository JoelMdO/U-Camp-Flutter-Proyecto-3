import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ucamp_project_3_travel_app/maldives.dart';
import 'package:ucamp_project_3_travel_app/marakech.dart';
import 'package:ucamp_project_3_travel_app/miami.dart';
import 'package:ucamp_project_3_travel_app/hongkong.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
//TRIGGER ANIMATION//
  bool selected = false;
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;

  @override
  void initState() {
//FOR FIRST ANIMATION//
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        selected = true;
      });
    });
    super.initState();
//FOR SECOND ANIMATION//
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        selected1 = true;
      });
    });
//FOR THIRD ANIMATION//
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        selected2 = true;
      });
    });
//FOR SECOND ANIMATION//
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        selected3 = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
//APP BAR//
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
            size: 15,
          ),
          backgroundColor: const Color(0xffFAEEDD),
          actions: <Widget>[
//TEXT//
            const Padding(
                padding: EdgeInsets.only(top: 20, right: 50),
                child: Text(
                  'Areas of Interest',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                )),
//ICON EMAIL//
            IconButton(
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
                )),
//ICON PHONE///
            IconButton(
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
                )),
          ],
        ),
        body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: ListView(
              children: <Widget>[
//BEACH SECTION//
                GestureDetector(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Maldives()),
                    );
                  }),
                  child: AnimatedOpacity(
                    opacity: selected ? 1.0 : 0.0,
                    duration: const Duration(seconds: 2),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 155,
                        padding: EdgeInsets.zero,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('lib/assets/BlueBack.png'))),
                        child: Stack(
                            fit: StackFit.loose,
                            alignment: AlignmentDirectional.topStart,
                            children: <Widget>[
                              //BEACH - BOXTITLE//
                              Positioned(
                                  top: 60,
                                  left: 30,
                                  child: AnimatedContainer(
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.bounceOut,
                                      child: const Image(
                                        image: AssetImage(
                                            'lib/assets/BlueTitle.png'),
                                      ))),
                              //BEACH - CIRCLE AVATAR//
                              const Positioned(
                                  left: 50,
                                  top: 10,
                                  child: Hero(
                                    tag: 'Hero1',
                                    child: CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.black,
                                        child: CircleAvatar(
                                            radius: 45,
                                            backgroundImage: AssetImage(
                                                'lib/assets/MLE.png'))),
                                  )),
                              //BEACH - TEXT TITLE//
                              Positioned(
                                  left: 230,
                                  top: 65,
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      RotateAnimatedText('BEACH',
                                          textStyle: const TextStyle(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w800)),
                                      RotateAnimatedText('PLAYA',
                                          textStyle: const TextStyle(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w800)),
                                    ],
                                  )),
                            ])),
                  ),
                ),
//CULTURAL SECTION//
                GestureDetector(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Marrakech()),
                    );
                  }),
                  child: AnimatedOpacity(
                    opacity: selected1 ? 1.0 : 0.0,
                    duration: const Duration(seconds: 2),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 155,
                        padding: EdgeInsets.zero,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('lib/assets/Brownback.png'))),
                        child: Stack(
                            fit: StackFit.loose,
                            alignment: AlignmentDirectional.topStart,
                            children: <Widget>[
                              //CULTURAL - BOXTITLE//
                              Positioned(
                                  top: 60,
                                  left: 30,
                                  child: AnimatedContainer(
                                      duration: const Duration(seconds: 2),
                                      curve: Curves.bounceOut,
                                      child: const Image(
                                        image: AssetImage(
                                            'lib/assets/BrownTitle.png'),
                                      ))),
                              //CULTURAL - CIRCLE AVATAR//
                              const Positioned(
                                  left: 50,
                                  top: 25,
                                  child: Hero(
                                    tag: 'Hero2',
                                    child: CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.black,
                                        child: CircleAvatar(
                                            radius: 45,
                                            backgroundImage: AssetImage(
                                                'lib/assets/RAK.png'))),
                                  )),
                              //CULTURAL - TEXT TITLE//
                              Positioned(
                                  left: 230,
                                  top: 90,
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      FadeAnimatedText('CULTURE',
                                          textStyle: const TextStyle(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w800)),
                                      FadeAnimatedText('CULTURAL',
                                          textStyle: const TextStyle(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w800)),
                                    ],
                                  )),
                            ])),
                  ),
                ),
//SPORTS SECTION//
                GestureDetector(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Miami()),
                    );
                  }),
                  child: AnimatedOpacity(
                    opacity: selected2 ? 1.0 : 0.0,
                    duration: const Duration(seconds: 2),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 155,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('lib/assets/GreenBack.png'))),
                        child: Stack(
                            fit: StackFit.loose,
                            alignment: AlignmentDirectional.topStart,
                            children: <Widget>[
                              //BEACH - BOXTITLE//
                              Positioned(
                                  top: 60,
                                  left: 30,
                                  child: AnimatedContainer(
                                      duration: const Duration(seconds: 2),
                                      curve: Curves.bounceOut,
                                      child: const Image(
                                        image: AssetImage(
                                            'lib/assets/GreenTitle.png'),
                                      ))),
                              //BEACH - CIRCLE AVATAR//
                              const Positioned(
                                  left: 50,
                                  top: 30,
                                  child: Hero(
                                    tag: 'Hero3',
                                    child: CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.black,
                                        child: CircleAvatar(
                                            radius: 45,
                                            backgroundImage: AssetImage(
                                                'lib/assets/SPORTS.png'))),
                                  )),
                              //BEACH - TEXT TITLE//
                              Positioned(
                                  left: 220,
                                  top: 90,
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      ScaleAnimatedText('SPORTIVE',
                                          textStyle: const TextStyle(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w800)),
                                      ScaleAnimatedText('DEPORTIVO',
                                          textStyle: const TextStyle(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w800)),
                                    ],
                                  )),
                            ])),
                  ),
                ),
//FAMILY SECTION//
                GestureDetector(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Hongkong()),
                    );
                  }),
                  child: AnimatedOpacity(
                    opacity: selected3 ? 1.0 : 0.0,
                    duration: const Duration(seconds: 2),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 155,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('lib/assets/PurpleBack.png'))),
                        child: Stack(
                            fit: StackFit.loose,
                            alignment: AlignmentDirectional.topStart,
                            children: <Widget>[
                              //BEACH - BOXTITLE//
                              Positioned(
                                  top: 60,
                                  left: 30,
                                  child: AnimatedContainer(
                                      duration: const Duration(seconds: 2),
                                      curve: Curves.bounceOut,
                                      child: const Image(
                                        image: AssetImage(
                                            'lib/assets/PurpleTitle.png'),
                                      ))),
                              //BEACH - CIRCLE AVATAR//
                              const Positioned(
                                  left: 50,
                                  top: 30,
                                  child: Hero(
                                    tag: 'Hero4',
                                    child: CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.black,
                                        child: CircleAvatar(
                                            radius: 45,
                                            backgroundImage: AssetImage(
                                                'lib/assets/FAMILY.png'))),
                                  )),
                              //BEACH - TEXT TITLE//
                              Positioned(
                                  left: 230,
                                  top: 90,
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      WavyAnimatedText('FAMILY',
                                          textStyle: const TextStyle(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w800)),
                                      WavyAnimatedText('EN FAMILIA',
                                          textStyle: const TextStyle(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w800)),
                                    ],
                                  )),
                            ])),
                  ),
                )
              ],
            )),
//BOTTOM NAVIGAION BAR//
        bottomNavigationBar: BottomNavigationBar(
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
        ),
      ),
    );
  }
}
