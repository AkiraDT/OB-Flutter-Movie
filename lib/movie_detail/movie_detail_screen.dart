import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moviedb/core/models/movie.dart';
import 'package:moviedb/movie_detail/widgets/movie_cast.dart';
import 'package:moviedb/movie_detail/widgets/movie_detail.dart';
import 'package:moviedb/movie_detail/widgets/movie_synopsis.dart';
import 'package:moviedb/movie_detail/widgets/video_player.dart';

class MovieDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie data = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        backgroundColor: Color(0XFF191926),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () => {Navigator.pop(context)},
              child: Icon(
                Icons.arrow_back_ios,
              ),
            ),
            actions: [
              IconButton(
                icon: new Icon(Icons.favorite),
                onPressed: () => print('yeah'),
                iconSize: 30,
                color: Colors.white,
              )
            ]),
        body: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.start,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 360,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: new BoxDecoration(
                          color: Colors.black,
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.6),
                                BlendMode.dstATop),
                            image: new NetworkImage(data.backdrop),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.6, 0.95],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          width: MediaQuery.of(context).size.width,
                          // height: 50,
                          bottom: 5,
                          child: MovieDetailWidget(data),
                      )
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'sinopsis',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                      MovieSynopsis(data.id),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: AutoSizeText(
                          'Trailer',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                      ),
                      VideoPlayer(data.id),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Cast',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                      MovieCastWidget(data.id)
                    ],
                  ))
            ],
          ),
        ));
  }
}
