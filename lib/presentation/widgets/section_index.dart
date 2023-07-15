import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ucamp_project_3_travel_app/presentation/pages/hongkong.dart';
import 'package:ucamp_project_3_travel_app/presentation/pages/maldives.dart';
import 'package:ucamp_project_3_travel_app/presentation/pages/marakech.dart';
import 'package:ucamp_project_3_travel_app/presentation/pages/miami.dart';

class SectionsIndex extends StatefulWidget {
  final String pagename,
      pagenamespanish,
      pagegeneral,
      background,
      title,
      hero,
      herotag;

  const SectionsIndex(
      {Key? key,
      required this.background,
      required this.pagename,
      required this.pagenamespanish,
      required this.pagegeneral,
      required this.hero,
      required this.herotag,
      required this.title})
      : super(key: key);
  @override
  State<SectionsIndex> createState() => _SectionsIndexState();
}

class _SectionsIndexState extends State<SectionsIndex> {
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
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(widget.background))),
        child: InkWell(
            onTap: (() {
              if (widget.pagename == 'BEACH' || widget.pagename == 'PLAYA') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Maldives(
                            pagegeneral: widget.pagegeneral,
                          )),
                );
              } else if (widget.pagename == 'CULTURE' ||
                  widget.pagename == 'CULTURAL') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Marrakech(
                            pagegeneral: widget.pagegeneral,
                          )),
                );
              } else if (widget.pagename == 'FAMILY' ||
                  widget.pagename == 'EN FAMILIA') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Hongkong(
                            pagegeneral: widget.pagegeneral,
                          )),
                );
              } else if (widget.pagename == 'SPORTIVE' ||
                  widget.pagename == 'DEPORTIVO') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Miami(
                            pagegeneral: widget.pagegeneral,
                          )),
                );
              }
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
                          child: Image(
                            image: AssetImage(widget.title),
                          ))),
                  //BEACH - CIRCLE AVATAR//
                  Positioned(
                      left: 50,
                      top: 10,
                      child: Hero(
                        tag: widget.herotag,
                        child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(widget.hero))),
                      )),
                  //BEACH - TEXT TITLE//
                  Positioned(
                      left: 230,
                      top: 65,
                      child: IgnorePointer(
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            RotateAnimatedText(widget.pagename,
                                textStyle: const TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800)),
                            RotateAnimatedText(widget.pagenamespanish,
                                textStyle: const TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800)),
                          ],
                        ),
                      )),
                  //BEACH - TEXT PARAMETERS TRANSFER//
                  Positioned(
                      left: 150,
                      top: 5,
                      child: IgnorePointer(
                        child: AnimatedTextKit(
                          repeatForever: false,
                          animatedTexts: [
                            TypewriterAnimatedText(widget.pagegeneral,
                                textStyle: const TextStyle(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      )),
                ])),
      ),
    );
  }
}
