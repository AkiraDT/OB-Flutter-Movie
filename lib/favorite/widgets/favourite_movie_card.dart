import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviedb/core/models/movie_favourite.dart';

class FavouriteMovieCard extends StatelessWidget{

  final MovieFavourite data;

  FavouriteMovieCard(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 1,
        // borderOnForeground: true,
        margin: EdgeInsets.all(15),
        color: Color(0XFF191926),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(right: 10),
                clipBehavior: Clip.none,
                child: Stack(
                  children: [
                    Positioned(
                      child: Image(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: NetworkImage(data.poster),
                      ),
                    ),
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.transparent, Color(0XFF191926)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.6, 0.82],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0XFF191926),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: AutoSizeText(
                              data.ageRating,
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                              minFontSize: 5,
                            ),
                        )
                    ),
                    Positioned(
                        top: 5,
                        right: 5,
                        child:  Icon(
                          Icons.favorite,
                          color: Color(0XFFFF3F6E),
                          size: 30,
                        )
                    ),
                    Positioned(
                        bottom: 5,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 20,
                              width: (MediaQuery.of(context).size.width/2) - 25,
                              child: AutoSizeText(
                                data.genres,
                                maxLines: 1,
                                // softWrap: true,
                                // overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0xffFF3466),
                                    fontSize: 20
                                ),
                                minFontSize: 8,
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
                                      child: Row(
                                        children: const <Widget>[
                                          Icon(
                                            Icons.star,
                                            color: Color(0XFFFF3F6E),
                                            size: 12,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color(0XFFFF3F6E),
                                            size: 12,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color(0XFFFF3F6E),
                                            size: 12,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color(0XFFFF3F6E),
                                            size: 12,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Color(0XFFFF3F6E),
                                            size: 12,
                                          ),
                                        ],
                                      )
                                  ),
                                  AutoSizeText(
                                    'Reviews',
                                    style: TextStyle(
                                        fontSize: 4,
                                        color: Colors.grey
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child:Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                data.title,
                                style:
                                TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text(
                                '${data.duration.toString()} MIN',
                                style:
                                TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey
                                ),
                              ),
                            ),
                            Container(
                              height: 110,
                              margin: EdgeInsets.only(bottom: 4),
                              child: SingleChildScrollView(
                                child: Text(
                                  data.synopsis,
                                  style:
                                  TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                            bottom: 10,
                            child: InkWell(
                                onTap: () => {print('yeah')},
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: <Color>[
                                            Color(0xFF8036E7),
                                            Color(0xFFFF3365),
                                          ]
                                      )
                                  ),
                                  height: 25,
                                  width: (MediaQuery.of(context).size.width/2) - 40,
                                  // padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                                  child: Text("BOOK YOUR TICKET",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      )),
                                ))
                        )
                      ],
                    )
                )
            ),
          ],
        ),
      ),
    );
  }

}