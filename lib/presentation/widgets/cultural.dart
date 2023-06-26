import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ucamp_project_3_travel_app/presentation/pages/marakech.dart';

class Cultural extends StatefulWidget {
  const Cultural({super.key});

  @override
  State<Cultural> createState() => _CulturalState();
}

class _CulturalState extends State<Cultural> {
  bool selected = false;

//DELAY TO START FOR FIRST ANIMATION//
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
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
                  image: AssetImage('lib/assets/Brownback.png'))),
          child: GestureDetector(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Marrakech()),
                );
              }),
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
                              image: AssetImage('lib/assets/BrownTitle.png'),
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
                                  backgroundImage:
                                      AssetImage('lib/assets/RAK.png'))),
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
        ));
  }
}
