import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/core/models/movie.dart';
import 'package:moviedb/core/models/movie_detail.dart';

import 'movie_detail_view_model.dart';

class MovieDetailWidget extends StatelessWidget{
  final Movie data;

  MovieDetailWidget(this.data);

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read(movieDetailViewModelProvider.notifier).loadData(data.id.toString());
    });

    return Container(
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
                  child:
                  Consumer(builder: (context, watch, widget){
                    final state = watch(movieDetailViewModelProvider);

                    return AutoSizeText(
                      state.data.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    );
                  }),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 2),
                  height: 20,
                  child: Consumer(builder: (context, watch, widget){
                    final state = watch(movieDetailViewModelProvider);

                    return AutoSizeText(
                      state is Success ? state.data.genres.elementAt(0).name : '',
                      style: TextStyle(
                          color: Color(0xffDEDDDF)),
                    );
                  }),
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
                      Consumer(builder: (context, watch, widget){
                        final state = watch(movieDetailViewModelProvider);

                        return AutoSizeText(
                          data.rating.toString() + ' / 10',
                          style: TextStyle(
                              fontSize: 9,
                              color: Colors.grey),
                        );
                      }),
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
    );
  }
  
}