import 'package:flutter/material.dart';
import 'package:ucamp_project_3_travel_app/page1.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//ANIMATION//
  bool selected = false;
  bool selected1 = false;

//AUTO TRIGGER FOR FIRST ANIMATION//
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        selected = true;
      });
    });
    super.initState();
    //DELAY FOR SECOND ANIMATION//
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        selected1 = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          backgroundColor: const Color(0xffFAEEDD),
          body: Stack(
              fit: StackFit.loose,
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
//TEXTO- TITULO//
                const Positioned(
                    top: 70,
                    left: 30,
                    child: Text('THE',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w600))),
                const Positioned(
                    top: 95,
                    left: 55,
                    child: Text('BEST',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 30,
                            fontWeight: FontWeight.w800))),
                const Positioned(
                    top: 130,
                    left: 110,
                    child: Text('TRAVEL',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w600))),
                const Positioned(
                    top: 160,
                    left: 130,
                    child: Text('DESTINATIONS',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 30,
                            fontWeight: FontWeight.w800))),
//BROWN BOX//
                Positioned(
                  top: 210,
                  left: 60,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(31),
                      child: Material(
                          child: Container(
                              width: 350,
                              height: 350,
                              color:
                                  const Color(0xff703232).withOpacity(0.7)))),
                ),
//EARTH//
                const Positioned(
                    top: 220,
                    left: 5,
                    child: Image(image: AssetImage('lib/assets/Earth.png'))),
//AIRPLANE//
                AnimatedPositioned(
                    width: selected ? 50.0 : 300.0,
                    height: selected ? 50.0 : 200.0,
                    top: selected ? 350.0 : 800.0,
                    left: selected ? 220.0 : 10.0,
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    child: const Image(
                      image: AssetImage('lib/assets/Airplane.png'),
                    )),
//EXPLORE BUTTON//
                AnimatedPositioned(
                    width: selected1 ? 510.0 : 0.0,
                    height: selected1 ? 570.0 : 0.0,
                    top: selected1 ? 220.0 : 350.0,
                    left: selected1 ? 0.0 : 200.0,
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeOut,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Page1()),
                        );
                      },
                      icon: Image.asset('lib/assets/Group 6.png'),
                    )),
              ]),
        ));
  }
}
