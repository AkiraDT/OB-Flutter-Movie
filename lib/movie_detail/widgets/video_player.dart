import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'movie_video_view_model.dart';

class VideoPlayer extends StatelessWidget {
  final int id;

  VideoPlayer(this.id);

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read(movieVideosViewModelProvider.notifier).loadData(id.toString());
    });

    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 180,
      child: Consumer(
        builder: ((context, watch, widget){
          final movieVideo = watch(movieVideosViewModelProvider);

          return YoutubePlayer(
            controller: YoutubePlayerController(
                initialVideoId:
                movieVideo is Success? movieVideo.data.url : '',
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
          );
        }),
      ),
    );
  }

}