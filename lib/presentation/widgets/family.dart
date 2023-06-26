import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ucamp_project_3_travel_app/presentation/pages/hongkong.dart';

class Family extends StatefulWidget {
  const Family({super.key});

  @override
  State<Family> createState() => _FamilyState();
}

class _FamilyState extends State<Family> {
  bool selected = false;

//DELAY TO START FOR FIRST ANIMATION//
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        selected = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AnimatedOpacity(
      opacity: selected ? 1.0 : 0.0,
      duration: const Duration(seconds: 2),
      child: Container(
        width: screenWidth,
        height: 155,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/PurpleBack.png'))),
        child: GestureDetector(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Hongkong()),
              );
            }),
            child: Stack(
                fit: StackFit.loose,
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                  //FAMILY - BOXTITLE//
                  Positioned(
                      top: 60,
                      left: 30,
                      child: AnimatedContainer(
                          duration: const Duration(seconds: 2),
                          curve: Curves.bounceOut,
                          child: const Image(
                            image: AssetImage('lib/assets/PurpleTitle.png'),
                          ))),
                  //FAMILY - CIRCLE AVATAR//
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
                                backgroundImage:
                                    AssetImage('lib/assets/FAMILY.png'))),
                      )),
                  //FAMILY - TEXT TITLE//
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
    );
  }
}
