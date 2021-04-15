import 'dart:math';

import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

const titlePaddingTop = 298.0;
const offsetWhereTitleDisappear = 34.0;
const secondary = Color(0xffeb445a);
const albumSongTitles = [
  'In My Blood',
  'Nervous',
  'Lost in Japan',
  'Where Were You in the Morning?',
  'Like to Be You',
  "Fallin' All in You",
  'Particular Taste',
  'Why',
  'Because I Had You',
  'Queen',
  'Youth',
  'Mutual',
  'Perfectly Wrong',
  "When You're Ready",
];

class _MyHomePageState extends State<MyHomePage> {
  late final ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  double get offset => controller.hasClients ? controller.offset : 0.0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // No appbar provided to the Scaffold, only a body with a
      // CustomScrollView.
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          InkWell(
            child: Icon(
              Icons.check,
              size: 24,
              color: secondary,
            ),
          ),
          Container(
            width: 24.0,
          ),
          InkWell(
            child: Icon(
              Icons.more_vert,
              size: 24,
              color: secondary,
            ),
          ),
          Container(
            width: 16.0,
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              final opacity = offset < titlePaddingTop
                  ? 0.0
                  : min(offset - titlePaddingTop, offsetWhereTitleDisappear) /
                      offsetWhereTitleDisappear;
              return Opacity(
                opacity: opacity,
                child: child,
              );
            },
            child: Container(
              height: 0.5,
              color: Colors.white,
            ),
          ),
        ),
        title: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            final additonalOffset = offset > titlePaddingTop &&
                    offset < (titlePaddingTop + offsetWhereTitleDisappear)
                ? (offset - titlePaddingTop) * (offsetWhereTitleDisappear / 25)
                : 0.0;
            final offsetY = max(
                additonalOffset == 0
                    ? titlePaddingTop + offsetWhereTitleDisappear - offset
                    : offsetWhereTitleDisappear - additonalOffset,
                0.0);
            return Transform.translate(
              offset: Offset(
                0,
                offsetY,
              ),
              child: child,
            );
          },
          child: Text(
            'Shawn Mendes',
            style: GoogleFonts.montserrat(
              fontSize: 14,
              height: 17 / 14,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              controller: controller,
              children: [
                Container(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.0),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/en/1/16/Shawn_Mendes_-_Shawn_Mendes_%28Official_Album_Cover%29.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 24,
                ),
                Container(
                  color: Colors.black38,
                  child: Text(
                    'Shawn Mendes',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      height: 25 / 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 8,
                ),
                Container(
                  color: Colors.black38,
                  child: Text(
                    'Shawn Mendes',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      height: 25 / 20,
                      color: secondary,
                    ),
                  ),
                ),
                Container(
                  height: 8,
                ),
                Text(
                  'POP \u00B7 2018',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 48),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.play_arrow,
                            color: secondary,
                            size: 28,
                          ),
                          label: Text(
                            'Play',
                            style: GoogleFonts.roboto(
                              color: secondary,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            primary: Color(0xff161517),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 16,
                    ),
                    Expanded(
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 48),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shuffle,
                            color: secondary,
                            size: 28,
                          ),
                          label: Text(
                            'Shuffle',
                            style: GoogleFonts.roboto(
                              color: secondary,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            primary: Color(0xff161517),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 16,
                ),
                ExpandableText(
                  'It only took Shawn Mendes three years to realize his pop dreams. After catching a wave of fame on Vine, he steered it into solo stardom with two chart-topping albums, a world tour, and a sold-out show at Madison Square Garden. Then, the Toronto-area native got right to work on his third album, an adventurous voyage of texture and tempo, with songwriting support from pop heavyweights like Ed Sheeran, Julia Michaels, and John Mayer. Lyrically, he’s still the same Shawn—brooding, broken, heart on his sleeve—but age and experience have emboldened him; heartbreak is no longer a curb on his powers, but his creative fuel. With a skillful balance of poise and risk-taking, he explores slick funk (“Particular Taste”), soulful piano ballads (“Perfectly Wrong”), and Kings of Leon-inspired pop-rock (“In My Blood”), showing us just how much he’s capable of.',
                  maxLines: 2,
                  expandText: 'MORE',
                  linkStyle: GoogleFonts.roboto(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  linkColor: Colors.white70,
                  style: GoogleFonts.roboto(
                    color: Colors.white70,
                    fontSize: 17,
                  ),
                ),
                Container(
                  height: 16,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 14,
                  itemBuilder: (context, pos) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 24.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white38,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 36,
                              child: Text(
                                pos.toString(),
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            Text(
                              albumSongTitles[pos],
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
