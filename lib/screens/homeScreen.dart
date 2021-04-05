import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_search/screens/movieSearch.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        alignment: Alignment.center,
        child: ZStack([
          VxBox()
              .white
              .size(context.screenWidth, context.percentHeight * 30)
              .rounded
              .make(),
          VStack([
            (context.percentHeight * 5).heightBox,
            "MOVIES SEARCH APP"
                .text
                .xl6
                .blue800
                .extraBold
                .center
                .makeCentered()
                .py16(),
            (context.percentHeight * 3).heightBox,
          ]),
          Center(
            child: Container(
              padding: EdgeInsets.all(70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Lottie.asset('assets/animations/theatre.json',
                      height: 200,
                      width: 250,
                      animate: true,
                      repeat: true,
                      reverse: true),
                  Lottie.asset('assets/animations/search.json',
                      height: 200,
                      width: 250,
                      animate: true,
                      repeat: true,
                      reverse: true),
                  FlatButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieSearch()));
                    },
                    color: Colors.black,
                    shape: Vx.roundedLg,
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 45,
                    ).shimmer(),
                    label: "Let's Go".text.xl4.white.wide.bold.make().shimmer(),
                  ).h(60)
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
