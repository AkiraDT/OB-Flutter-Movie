import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moviedb/core/services/movie_service.dart';
import 'package:moviedb/movie/widgets/popular/popular_movies.dart';
import 'package:moviedb/movie/widgets/popular/popular_movies_view_model.dart';
import 'package:moviedb/movie/widgets/upcoming/upcoming_movies.dart';
import 'package:moviedb/movie/widgets/upcoming/upcoming_movies_view_model.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../mock/upcoming_response.dart';
import 'movie_screen_test.mocks.dart';

@GenerateMocks([UpcomingMoviesViewModel, PopularMoviesViewModel, MovieService])
void main() {
  final mockMovieService = MockMovieService();
  when(mockMovieService.getUpcoming(1, 5)).thenAnswer((realInvocation) async =>
      Future.delayed(
          Duration(milliseconds: 100), () => Future.value(dummyUpcommingList)));

  when(mockMovieService.getPopularMovie(1)).thenAnswer((realInvocation) async =>
      Future.delayed(Duration(milliseconds: 100),
          () => Future.value((dummyUpcommingList))));

  final mockUpcomingMovieViewModel = MockUpcomingMoviesViewModel();
  final mockPopularMoviesViewModel = MockPopularMoviesViewModel();
  when(mockUpcomingMovieViewModel.loadData())
      .thenAnswer((realInvocation) => null);
  when(mockPopularMoviesViewModel.loadData())
      .thenAnswer((realInvocation) => null);

  testWidgets('Movie: Upcomming screen widget', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      final screen = UpcomingMovies();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            upcomingMoviesViewModelProvider.overrideWithProvider(
                StateNotifierProvider(
                    (ref) => UpcomingMoviesViewModel(mockMovieService)))
          ],
          child: MaterialApp(
            home: SingleChildScrollView(
              child: screen,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle(Duration(milliseconds: 200));
      expect(find.byWidget(screen), findsWidgets);
    });
  });

  testWidgets('Movie: Popular screen widget', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      final screen = PopularMovies();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            popularMoviesViewModelProvider.overrideWithProvider(
                StateNotifierProvider(
                    (ref) => PopularMoviesViewModel(mockMovieService)))
          ],
          child: MaterialApp(
            home: SingleChildScrollView(
              child: screen,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle(Duration(milliseconds: 200));
      expect(find.byWidget(screen), findsWidgets);
    });
  });
}
