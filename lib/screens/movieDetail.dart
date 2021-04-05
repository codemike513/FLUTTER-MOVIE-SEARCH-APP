import 'package:flutter/material.dart';
import 'package:movie_search/components/PaddedText.dart';
import 'package:movie_search/models/movieInfo.dart';
import 'package:movie_search/services/movieService.dart';
import 'package:velocity_x/velocity_x.dart';

class MovieDetail extends StatelessWidget {
  final String movieName;
  final String imdbId;

  MovieDetail({this.movieName, this.imdbId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.lightBlueAccent.withOpacity(0.4),
                      Colors.purpleAccent.withOpacity(0.4)
                    ]),
              ),
              child: Column(children: [
                ZStack([
                  VxBox()
                      .purple400
                      .size(context.screenWidth, context.percentHeight * 22)
                      .roundedLg
                      .make(),
                  VStack([
                    (context.percentHeight * 5).heightBox,
                    this
                        .movieName
                        .text
                        .xl4
                        .black
                        .bold
                        .center
                        .makeCentered()
                        .py16(),
                    (context.percentHeight * 1).heightBox,
                  ])
                ]),
                Container(
                  child: FutureBuilder<MovieInfo>(
                      future: getMovie(this.imdbId),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            child: SingleChildScrollView(
                              child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 0, 10),
                                          alignment: Alignment.center,
                                          child: Image.network(
                                            snapshot.data.poster,
                                            width: 200,
                                          ),
                                        ),
                                        Text(snapshot.data.plot,
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500)),
                                        PaddedText(
                                            "\nYear : " + snapshot.data.year),
                                        PaddedText(
                                            "Genre : " + snapshot.data.genre),
                                        PaddedText("Directed by : " +
                                            snapshot.data.director),
                                        PaddedText("Runtime : " +
                                            snapshot.data.runtime),
                                        PaddedText(
                                            "Rated : " + snapshot.data.rating),
                                        PaddedText("IMDB Rating : " +
                                            snapshot.data.imdbRating),
                                        PaddedText("Meta Score : " +
                                            snapshot.data.metaScore),
                                      ])),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
                ),
              ])),
        ),
      ),
    );
  }
}
