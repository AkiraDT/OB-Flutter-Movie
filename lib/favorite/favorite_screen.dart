import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/core/providers/firebase_analytics_provider.dart';
import 'package:moviedb/favorite/favourite_view_model.dart';
import 'package:moviedb/favorite/widgets/favourite_movie_card.dart';

class FavoriteScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read(favouriteMovieViewModelProvider.notifier).loadData();
    });

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await context.read(analyticsProvider).logEvent(name: 'Movie_screen');
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF191926),
        title: Text('Favourite Movie'),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, watch, widget){

          final state = watch(favouriteMovieViewModelProvider);

          return state is Success ?
            (state.data.length > 0 ?
              ListView.builder(
                itemCount: state.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return FavouriteMovieCard(state.data[index]);
                }
              ) : Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Text('No Data', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
              )
            ) :
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
            );
        }
      ),
    );
  }
}