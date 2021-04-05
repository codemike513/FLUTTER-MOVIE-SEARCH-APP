import 'package:flutter/material.dart';
import '../models/movie.dart' as models;

class MovieItem extends StatelessWidget {
  final models.Movie movie;

  MovieItem({this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(children: <Widget>[
                if (this.movie.poster != "N/A")
                  Image.network(this.movie.poster, height: 100, width: 100)
              ]),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this.movie.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(this.movie.year, style: TextStyle(fontSize: 18)),
                      Text((this.movie.type).toUpperCase(), style: TextStyle(fontSize: 16))
                    ]),
              )
            ],
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 8, left: 10, right: 10),
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Colors.white),
        ),
      ),
    );
  }
}
