import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ucamp_project_3_travel_app/app/widgets/appbar.dart';
import 'package:ucamp_project_3_travel_app/app/widgets/bottom_navigation_bar.dart';
import 'package:ucamp_project_3_travel_app/presentation/pages/formato.dart';
import 'package:ucamp_project_3_travel_app/presentation/pages/menu.dart';
import 'package:like_button/like_button.dart';
import 'package:delayed_display/delayed_display.dart';

class Marrakech extends StatefulWidget {
  const Marrakech({Key? key}) : super(key: key);

  @override
  State<Marrakech> createState() => _MarrakechState();
}

class _MarrakechState extends State<Marrakech> {
//TRIGGER ANIMATION//
  bool selected = false;

  @override
  void initState() {
//FOR FIRST ANIMATION//
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        selected = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
//APP BAR//
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(35), child: AppBarGeneral()),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
                fit: StackFit.loose,
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
//BROWN BACKGROUND//
                  Positioned(
                      top: 180,
                      child: DelayedDisplay(
                          delay: const Duration(seconds: 3),
                          child: Container(
                              height: 500,
                              width: 350,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('lib/assets/Group 2.png')),
                              )))),
//CIRCLE AVATAR//
                  const Positioned(
                      left: 20,
                      top: 70,
                      child: Hero(
                        tag: 'Hero2',
                        child: CircleAvatar(
                            radius: 135,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                                radius: 130,
                                backgroundImage:
                                    AssetImage('lib/assets/RAK.png'))),
                      )),
//LIKE BUTTON//
                  Positioned(
                      top: 340,
                      left: 300,
                      child: DelayedDisplay(
                          delay: const Duration(seconds: 3),
                          child: LikeButton(
                              size: 30,
                              circleColor: const CircleColor(
                                  start: Colors.lightGreen, end: Colors.orange),
                              bubblesColor: const BubblesColor(
                                  dotPrimaryColor: Colors.yellow,
                                  dotSecondaryColor: Colors.blueAccent),
                              likeBuilder: (isLiked) => Icon(
                                    Icons.thumb_up,
                                    color: isLiked
                                        ? const Color(0xffF95A00)
                                        : Colors.black26,
                                    size: 30,
                                  ),
                              likeCount: 22,
                              countBuilder: ((likeCount, isLiked, text) {
                                var color = isLiked
                                    ? const Color(0xffF95A00)
                                    : Colors.grey;
                                Widget result;
                                if (likeCount == 0) {
                                  result = Text(
                                    '',
                                    style: TextStyle(color: color),
                                  );
                                } else {
                                  result = Text(
                                    text,
                                    style: TextStyle(color: color),
                                  );
                                }
                                return result;
                              })))),
//TITLE//
                  AnimatedContainer(
                    width: selected ? 350.0 : 0.0,
                    height: selected ? 150 : 0.0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInCubic,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: (AssetImage(
                                'lib/assets/Title Marrakech.png')))),
                  ), // This trailing comma makes auto-formatting nicer for build methods.
//FACTS//
                  Positioned(
                      top: 340,
                      left: 10,
                      child: DelayedDisplay(
                          delay: const Duration(seconds: 3),
                          child: AnimatedTextKit(
                              animatedTexts: [
                                ScaleAnimatedText(
                                  'Facts:',
                                  textStyle: const TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                              isRepeatingAnimation: true,
                              repeatForever: false,
                              totalRepeatCount: 4,
                              onFinished: (() {
                                const Text('Facts:');
                              })))),
//TEXT//
                  Positioned(
                      top: 400,
                      left: 10,
                      child: DelayedDisplay(
                          delay: const Duration(seconds: 4),
                          child: SizedBox(
                              width: 400,
                              height: 300,
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    '- The flavors of the Arab culture.\n\n - Unique walking\'s through their\n  souq\'s, desert and mountains. \n\n - Sleep in a classic Riad.',
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                    speed: const Duration(milliseconds: 100),
                                  )
                                ],
                                isRepeatingAnimation: false,
                                repeatForever: false,
                              )))),
//BUTTONS//
                  Positioned(
                      top: 550,
                      right: 15,
                      child: DelayedDisplay(
                          delay: const Duration(seconds: 15),
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
                                    'Continue Exploring',
                                    style: TextStyle(color: Colors.black38),
                                  )),

                              ///BOOKING BUTTON//
                              Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xffDB4A1A),
                                          side: const BorderSide(
                                              color: Color(0xff880B0B),
                                              width: 2.0)),
                                      onPressed: () async {
                                        //SEND A VALUE TO LOAD IMAGE ON BOOKING FORM PAGE
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Formato()));
                                        setState(() {
                                          // ignore: unused_local_variable
                                          var value = 2;
                                        });
                                      },
                                      child: const Text(
                                        'Book your night',
                                        style: TextStyle(color: Colors.white),
                                      )))
                            ],
                          )))
                ]),
          ),
//BOTTOM NAVIGAION BAR//
          bottomNavigationBar:
              SizedBox(height: 35, child: BottomNavigationBarGeneral()),
        ));
  }
}
