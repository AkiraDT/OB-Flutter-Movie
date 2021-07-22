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

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read(movieVideosViewModelProvider.notifier).loadData(id.toString());
    });

    return Consumer(
        builder: ((context, watch, widget){
          final movieVideo = watch(movieVideosViewModelProvider);

          return movieVideo is Success ? YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: movieVideo.data.url,
              flags: YoutubePlayerFlags(
                // hideControls: true,
                hideThumbnail: true,
                controlsVisibleAtStart: true,
                autoPlay: false,
                mute: false,
                forceHD: false,
              ),
            ),
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
            progressColors: ProgressBarColors(
              playedColor: Colors.red,
              handleColor: Colors.redAccent,
            ),
            onReady: () => {print('Youtube Ready')},
          ) : Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }),
    );
  }

}