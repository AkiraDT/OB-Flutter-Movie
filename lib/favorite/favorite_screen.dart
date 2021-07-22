import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF191926),
        leading: GestureDetector(
          onTap: () => {Navigator.pop(context)},
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text('Favourite Movie'),
        centerTitle: true,
      ),
      body:
          Container(
            height: 280,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 1,
              // borderOnForeground: true,
              margin: EdgeInsets.all(10),
              color: Color(0XFF191926),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.none,
                    width: (MediaQuery.of(context).size.width/2) - 10,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage('https://m.media-amazon.com/images/M/MV5BYjcyYTk0N2YtMzc4ZC00Y2E0LWFkNDgtNjE1MzZmMGE1YjY1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg'),
                          ),
                        ),
                        Positioned.fill(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.black.withOpacity(0.95)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.6, 0.85],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              height: 30,
                              width: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0XFF191926),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: AutoSizeText(
                                '16+',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                        ),
                        Positioned(
                            bottom: 10,
                            left: 10,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 2),
                                  height: 20,
                                  child: AutoSizeText(
                                      'ddsd',
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
                                          'DD',
                                          style: TextStyle(
                                              fontSize: 9,
                                              color: Colors.grey),
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
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child:Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 2),
                              child: Text(
                                'Movie title',
                                style:
                                TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Text(
                                'Dur',
                                style:
                                TextStyle(
                                    fontSize: 12
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 4),
                              child: Text(
                                'Sinopsis Data',
                                style:
                                TextStyle(
                                    fontSize: 10
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
                ],
              ),
            ),
          ),
    );
  }
}