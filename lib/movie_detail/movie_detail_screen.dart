import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/core/models/movie.dart';
import 'package:moviedb/movie_detail/movie_cast_view_model.dart';
import 'package:moviedb/movie_detail/movie_video_view_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'movie_detail_view_model.dart';

class MovieDetailScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final Movie data = ModalRoute.of(context)!.settings.arguments as Movie;
    final movieDetail = watch(movieDetailViewModelProvider);
    final movieVideo = watch(movieVideosViewModelProvider);
    final movieCast = watch(movieCastViewModelProvider);

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
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: AutoSizeText(
                                          data.title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 2),
                                        height: 20,
                                        child: AutoSizeText(
                                          movieDetail is Loading || movieDetail is Initial ? '' : movieDetail.data.genres.elementAt(0).name,
                                          style: TextStyle(
                                              color: Color(0xffDEDDDF)),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 2),
                                        height: 20,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 5),
                                              child: IconButton(
                                                icon: new Icon(Icons.star),
                                                onPressed: () => print('yeah'),
                                                iconSize: 20,
                                                color: Colors.orangeAccent,
                                                padding: EdgeInsets.all(0),
                                                constraints:
                                                    BoxConstraints.tight(
                                                        Size.square(20)),
                                              ),
                                            ),
                                            AutoSizeText(
                                              data.rating.toString() + ' / 10',
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        margin: EdgeInsets.only(bottom: 2),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 5),
                                              child: IconButton(
                                                icon: new Icon(Icons
                                                    .thumb_up_alt_outlined),
                                                onPressed: () => print('yeah'),
                                                iconSize: 20,
                                                color: Colors.grey,
                                                padding: EdgeInsets.all(0),
                                                constraints:
                                                    BoxConstraints.tight(
                                                        Size.square(20)),
                                              ),
                                            ),
                                            AutoSizeText(
                                              'Users',
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 170,
                                        height: 30,
                                        margin: EdgeInsets.only(top: 15),
                                        child: InkWell(
                                            onTap: () => {print('yeah')},
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Color(0XFFE82626),
                                              ),
                                              height: 57,
                                              width: 305,
                                              // padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                                              child: Text("Watch Now",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white)),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                    width: 110,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(data.poster),
                                          fit: BoxFit.cover,
                                        ))),
                              ],
                            ),
                          ))
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
                      (movieDetail is Loading || movieDetail is Initial
                          ? Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator())
                          : AutoSizeText(
                              movieDetail.data.overview,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(height: 2),
                            ))
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
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // height: 180,
                        child: YoutubePlayer(
                          controller: YoutubePlayerController(
                              initialVideoId:
                                  movieVideo is Loading || movieVideo is Initial
                                      ? ''
                                      : movieVideo.data.url,
                              flags: YoutubePlayerFlags(
                                autoPlay: false,
                                mute: false,
                                controlsVisibleAtStart: true,
                              )),
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.red,
                          progressColors: ProgressBarColors(
                            playedColor: Colors.red,
                            handleColor: Colors.redAccent,
                          ),
                          onReady: () {
                            print('player ready');
                            // _controller.addListener(listener);
                          },
                        ),
                      )
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
                      Container(
                          width: double.infinity,
                          height: 200,
                          child: (movieCast is Loading || movieCast is Initial
                              ? Container(
                                  height: 90,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator())
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: movieCast.data.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                movieCast.data
                                                    .elementAt(index)
                                                    .picture,
                                              ),
                                              fit: BoxFit.cover,
                                              alignment: Alignment.topCenter
                                            )
                                          ),
                                          margin: EdgeInsets.only(
                                              right: 10, bottom: 2),
                                        ),
                                        Container(
                                          width: 100,
                                          child: AutoSizeText(
                                            movieCast.data
                                                .elementAt(index)
                                                .name,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    );
                                  })))
                    ],
                  ))
            ],
          ),
        ));
  }
}
