import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ucamp_project_3_travel_app/presentation/widgets/places_index.dart';

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

//MAP FOR PAGE SELECTION
  //MAP FOR PAGE SELECTION
  final Map<String, Widget Function(String)> pageRoutes = {
    'BEACH': (title) => const PlacesIndex(
          pagename: 'BEACH',
          pagenamespanish: 'PLAYA',
          background: 'lib/assets/MaldBlue.png',
          title: 'lib/assets/Title.png',
          herotag: 'Hero1',
          hero: 'lib/assets/MLE.png',
          text:
              '- Adventure to take a seaplane to reach your hotel.\n\n - Sleep surrounded by two oceans, the only land \n  is where your hotel is placed.\n\n - Categorized as the 5 best sunsets in the world.',
        ),
    'PLAYA': (title) => const PlacesIndex(
          pagename: 'BEACH',
          pagenamespanish: 'PLAYA',
          background: 'lib/assets/MaldBlue.png',
          title: 'lib/assets/Title.png',
          herotag: 'Hero1',
          hero: 'lib/assets/MLE.png',
          text:
              '- Adventure to take a seaplane to reach your hotel.\n\n - Sleep surrounded by two oceans, the only land \n  is where your hotel is placed.\n\n - Categorized as the 5 best sunsets in the world.',
        ),
    'CULTURE': (title) => const PlacesIndex(
          pagename: 'CULTURE',
          pagenamespanish: 'CULTURAL',
          background: 'lib/assets/Group 2.png',
          title: 'lib/assets/Title Marrakech.png',
          herotag: 'Hero2',
          hero: 'lib/assets/RAK.png',
          text:
              'The flavors of the Arab culture\n\n - Unique walking\'s through their\n  souq\'s, desert and mountains. \n\n - Sleep in a classic Riad.',
        ),
    'CULTURAL': (title) => const PlacesIndex(
          pagename: 'CULTURE',
          pagenamespanish: 'CULTURAL',
          background: 'lib/assets/Group 2.png',
          title: 'lib/assets/Title Marrakech.png',
          herotag: 'Hero2',
          hero: 'lib/assets/RAK.png',
          text:
              'The flavors of the Arab culture\n\n - Unique walking\'s through their\n  souq\'s, desert and mountains. \n\n - Sleep in a classic Riad.',
        ),
    'FAMILY': (title) => const PlacesIndex(
          pagename: 'FAMILY',
          pagenamespanish: 'EN FAMILIA',
          background: 'lib/assets/Group 4.png',
          title: 'lib/assets/Title Hongkong.png',
          herotag: 'Hero3',
          hero: 'lib/assets/FAMILY.png',
          text:
              'The Far East Disneyland a place for all ages.\n\n - Facilities and transportation to make your visit\n easy even with a baby stroller.\n\n - Shopping and food for all tastes.',
        ),
    'EN FAMILIA': (title) => const PlacesIndex(
          pagename: 'FAMILY',
          pagenamespanish: 'EN FAMILIA',
          background: 'lib/assets/Group 4.png',
          title: 'lib/assets/Title Hongkong.png',
          herotag: 'Hero3',
          hero: 'lib/assets/FAMILY.png',
          text:
              ' The Far East Disneyland a place for all ages.\n\n - Facilities and transportation to make your visit\n easy even with a baby stroller.\n\n - Shopping and food for all tastes.',
        ),
    'SPORTIVE': (title) => const PlacesIndex(
          pagename: 'SPORTIVE',
          pagenamespanish: 'DEPORTIVO',
          background: 'lib/assets/Group 3.png',
          title: 'lib/assets/Title Miami.png',
          herotag: 'Hero4',
          hero: 'lib/assets/SPORTS.png',
          text:
              'A city with all the sports:\n\n - From F1, Soccer, Football,\n  basketball.. you named it. \n\n - Plus best shopping malls, culinary\n international food\n etc. ',
        ),
    'DEPORTIVO': (title) => const PlacesIndex(
          pagename: 'SPORTIVE',
          pagenamespanish: 'DEPORTIVO',
          background: 'lib/assets/Group 3.png',
          title: 'lib/assets/Title Miami.png',
          herotag: 'Hero4',
          hero: 'lib/assets/SPORTS.png',
          text:
              'A city with all the sports:\n\n - From F1, Soccer, Football,\n  basketball.. you named it. \n\n - Plus best shopping malls, culinary\n international food\n etc. ',
        ),
  };

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
            onTap: () {
              final destinationBuilder = pageRoutes[widget.pagename];
              if (destinationBuilder != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            destinationBuilder(widget.title)));
              }
            },

            /// THIS IS THE STACK WHERE EACH ITEM OF THE MENU IS CREATED
            /// SEE BELOW EACH SECTION WHICH IS REFERRED AS WIDGET FOR EXAMPLE [WIDGET.TITLE]
            child: Stack(
                fit: StackFit.loose,
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                  ///TITLE//
                  Positioned(
                      top: 60,
                      left: 30,
                      child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.bounceOut,
                          child: Image(
                            image: AssetImage(widget.title),
                          ))),

                  ///CIRCLE AVATAR//
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

                  ///PAGE NAME ENGLISH AND SPANISH - TEXT TITLE//
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

                  ///PAGE GENERAL - TEXT PARAMETERS TRANSFER//
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
