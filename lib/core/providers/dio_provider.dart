import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final Dio dio = AppDio.getInstance(ref);
  ref.onDispose(() {
    dio.close();
  });
  return dio;
});

class AppDio with DioMixin implements Dio {
  final ProviderReference ref;

  AppDio._(this.ref, [BaseOptions? options]) {
    options = BaseOptions(
      contentType: 'application/json',
      connectTimeout: 30000,
      sendTimeout: 30000,
      receiveTimeout: 30000,
    );

    this.options = options;

    if (kDebugMode) {
      // Local Log
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance(ProviderReference ref) => AppDio._(ref);
}
