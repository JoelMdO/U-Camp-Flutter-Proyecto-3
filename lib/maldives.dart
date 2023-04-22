import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ucamp_project_3_travel_app/formato.dart';
import 'package:ucamp_project_3_travel_app/page1.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:delayed_display/delayed_display.dart';

class Maldives extends StatefulWidget {
  const Maldives({Key? key}) : super(key: key);

  @override
  State<Maldives> createState() => _MaldivesState();
}

class _MaldivesState extends State<Maldives> {
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
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
              fit: StackFit.loose,
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
//BLUE BACKGROUND//
                Positioned(
                    top: 180,
                    child: DelayedDisplay(
                        delay: const Duration(seconds: 3),
                        child: Container(
                            height: 500,
                            width: 350,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('lib/assets/MaldBlue.png')),
                            )))),
//CIRCLE AVATAR//
                const Positioned(
                    left: 20,
                    top: 70,
                    child: Hero(
                      tag: 'Hero1',
                      child: CircleAvatar(
                          radius: 135,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                              radius: 130,
                              backgroundImage:
                                  AssetImage('lib/assets/MLE.png'))),
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
                          image: (AssetImage('lib/assets/Title.png')))),
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
                                    fontSize: 50, fontWeight: FontWeight.w600),
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
                        delay: const Duration(seconds: 3),
                        child: SizedBox(
                            width: 400,
                            height: 300,
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  '- Adventure to take a seaplane to reach your hotel.\n\n - Sleep surrounded by two oceans, the only land \n  is where your hotel is placed.\n\n - Categorized as the 5 best sunsets in the world.',
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
                    left: 130,
                    child: DelayedDisplay(
                        delay: const Duration(seconds: 19),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            //NON BOOKING BUTTON//
                            TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    side: const BorderSide(
                                        color: Color(0xff880B0B), width: 2.0)),
                                onPressed: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Page1()),
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
                                        var value = 1;
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
