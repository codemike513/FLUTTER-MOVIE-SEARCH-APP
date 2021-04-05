import 'package:flutter/material.dart';
import 'package:movie_search/components/movieList.dart';
import 'package:movie_search/models/movie.dart';
import 'package:movie_search/screens/movieDetail.dart';
import 'package:movie_search/services/movieService.dart';
import 'package:velocity_x/velocity_x.dart';

class MovieSearch extends StatefulWidget {
  @override
  _MovieSearchState createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {
  final searchTextController = new TextEditingController();
  String searchText = "";

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  void itemClick(Movie item) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MovieDetail(
                movieName: item.title,
                imdbId: item.imdbID,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.amberAccent.withOpacity(0.6),
                    Colors.orangeAccent.withOpacity(0.6)
                  ]),
            ),
            child: Column(
              children: [
                ZStack([
                  VxBox()
                      .amber400
                      .size(context.screenWidth, context.percentHeight * 18)
                      .roundedLg
                      .make(),
                  VStack([
                    (context.percentHeight * 5).heightBox,
                    "Search Movies"
                        .text
                        .xl5
                        .black
                        .bold
                        .center
                        .makeCentered()
                        .py16(),
                    (context.percentHeight * 2).heightBox,
                  ])
                ]),
                Container(
                  child: Row(children: <Widget>[
                    Flexible(
                      child: TextField(
                        controller: searchTextController,
                        decoration: InputDecoration(
                            hintText: 'Enter a Movie Name.',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)))),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      tooltip: 'Search Movies',
                      iconSize: 40,
                      onPressed: () {
                        setState(() {
                          searchText = searchTextController.text;
                          // SystemChannels.textInput
                          // .invokeMethod('TextInput.hide');
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                        });
                      },
                    ),
                  ]),
                  padding: EdgeInsets.all(10),
                ),
                if (searchText.length > 0)
                  FutureBuilder<List<Movie>>(
                      future: searchMovies(searchText),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(
                              child: MovieList(
                                  movies: snapshot.data,
                                  itemClick: this.itemClick));
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      }),
              ],
            )));
  }
}
