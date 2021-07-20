import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/movie/widgets/popular/popular_movies_view_model.dart';
import 'package:moviedb/movie_detail/movie_cast_view_model.dart';
import 'package:moviedb/movie_detail/movie_detail_view_model.dart';
import 'package:moviedb/movie_detail/movie_video_view_model.dart';

class PopularMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Popular Movies',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
          Consumer(builder: (context, watch, child) {
            final state = watch(popularMoviesViewModelProvider);
            if (state is Loading) {
              return Container(
                  height: 400,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator());
            } else {
              return Container(
                width: double.infinity,
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context.read(movieDetailViewModelProvider.notifier).loadData(state.data[index].id.toString());
                          context.read(movieVideosViewModelProvider.notifier).loadData(state.data[index].id.toString());
                          context.read(movieCastViewModelProvider.notifier).loadData(state.data[index].id.toString());
                          Navigator.pushNamed(context, '/movieDetail',
                              arguments: state.data[index]);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 5, left: 10),
                          child: Image.network(state.data[index].poster,
                              height: 300, width: 150),
                        ),
                      );
                    }),
              );
            }
          })
        ],
      ),
    );
  }
}
