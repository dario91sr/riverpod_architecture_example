import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import 'retrofit_client.dart';
import 'talker.dart';

part 'http.client.g.dart';

/// Base URL of our API service
const baseUrl = 'https://api.weatherapi.com/v1';
const apiKey = String.fromEnvironment('WEATHER_API_KEY');

@riverpod
WeatherApiClient httpClient(HttpClientRef ref, {bool enableLogging = true}) {
  final options = BaseOptions(baseUrl: baseUrl, queryParameters: {'key': apiKey});
  final dio = Dio(options);
  final client = WeatherApiClient(dio);
  ref.onDispose(dio.close);

  if (enableLogging) dio.interceptors.add(TalkerDioLogger(talker: talker));

  return client;
}
