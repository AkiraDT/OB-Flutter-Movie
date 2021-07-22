import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/movie_detail/widgets/movie_detail_view_model.dart';

class MovieSynopsis extends StatelessWidget{
  final int id;

  MovieSynopsis(this.id);

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read(movieDetailViewModelProvider.notifier).loadData(id.toString());
    });

    return Consumer(builder: (context, watch, widget){
      final state = watch(movieDetailViewModelProvider);
      return state is Success ?
      AutoSizeText(
        state.data.overview,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(height: 2),): Container(
          height: 70,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: CircularProgressIndicator()
      );
    });
  }

}