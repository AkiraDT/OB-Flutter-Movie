import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:moviedb/core/common/constants.dart';
import 'package:moviedb/core/models/async_state.dart';
import 'package:moviedb/core/models/movie.dart';
import 'package:moviedb/core/providers/dio_provider.dart';
import 'package:moviedb/core/services/movie_service.dart';

import '../mock/upcoming_response.dart';

void main() {
  final mockDioProvider = Dio();
  final mockDioAdapter = DioAdapter();
  const pathUpcomming =
      '${API_URL}movie/upcoming?api_key=$API_KEY&language=en-US&page=1';
  mockDioProvider.httpClientAdapter = mockDioAdapter;
  //
  test('MovieService - getUpccoming - Success', () async {
    mockDioAdapter.onGet(
        pathUpcomming, (request) => request.reply(200, dummyUpcommingResApi));

    final container = ProviderContainer(
        overrides: [dioProvider.overrideWithValue(mockDioProvider)]);
    final service = container.read(movieServiceProvider);
    List<Movie> upcomming = await service.getUpcoming(1, 5);
    print(upcomming.toString());

    expect(upcomming.length, Success(dummyUpcommingList).data.length);
  });

}
