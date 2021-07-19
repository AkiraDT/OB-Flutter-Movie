import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviedb/movie/widgets/popular/popular_movies.dart';
import 'package:moviedb/movie/widgets/upcoming/upcoming_movies.dart';

class MovieScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              UpcomingMovies(),
              SizedBox(height: 20),
              PopularMovies()
            ],
          ),
        ),
      )
    );
  }
}