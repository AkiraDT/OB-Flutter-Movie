import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/movie_detail/widgets/movie_cast_view_model.dart';

class MovieCastWidget extends StatelessWidget {
  final int id;

  MovieCastWidget(this.id);

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read(movieCastViewModelProvider.notifier).loadData(id.toString());
    });

    return Container(
        width: double.infinity,
        height: 200,
        child: Consumer(builder: (context, watch, widget) {
          final state = watch(movieCastViewModelProvider);
          return state is Success
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    state.data.elementAt(index).picture,
                                  ),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter)),
                          margin: EdgeInsets.only(right: 10, bottom: 2),
                        ),
                        Container(
                          width: 100,
                          child: AutoSizeText(
                            state.data.elementAt(index).name,
                            maxLines: 2,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    );
                  })
              : Container(
                  height: 90,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator());
        }));
  }
}
