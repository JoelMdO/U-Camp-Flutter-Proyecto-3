import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ucamp_project_3_travel_app/presentation/pages/maldives.dart';

class Beach extends StatefulWidget {
  const Beach({Key? key}) : super(key: key);
  @override
  State<Beach> createState() => _BeachState();
}

class _BeachState extends State<Beach> {
  bool selected = false;

//DELAY TO START FOR FIRST ANIMATION//
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
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
            image:
                DecorationImage(image: AssetImage('lib/assets/BlueBack.png'))),
        child: GestureDetector(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Maldives()),
              );
            }),
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
                            image: AssetImage('lib/assets/BlueTitle.png'),
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
                                backgroundImage:
                                    AssetImage('lib/assets/MLE.png'))),
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
    );
  }
}
