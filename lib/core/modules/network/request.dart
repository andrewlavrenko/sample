import 'package:dio/dio.dart';

class HttpMethod {
  static Options get() => Options(method: 'GET');
  //static Options get() => Options(method: 'GET', headers: {
  //  'Content-Type': 'application/json',
  //  'Accept': 'application/json',
  //  'Authorization':
  //  'Bearer eyJhbGciOiJIUzUxMiJ9.eyJqdGkiOiJmOTIyNDFjZC03MWRjLTQzNGEtOTM2OS02ZTYxOWYwMzI4YWQiLCJzdWIiOiJmYjZmM2Y5YS01YzBmLTQ2MjAtOWQ1ZC01N2VlNTY5MmYxZGEiLCJpYXQiOjE2NjkzOTkzMjAsImV4cCI6MTY3NDU4MzMyMCwicm9sZXMiOiJST0xFX0NMSUVOVCJ9.gu8LbJXVhzpENtGkn5ruE8jlv2ITs9PFuDvATaefYcd3i13KRZBde0Lg8cP4QGulHh-8mw_WG4CPK24iH8tyHA',
  //});
  static Options post() => Options(method: 'POST');
  static Options patch() => Options(method: 'PATCH');
  static Options delete() => Options(method: 'DELETE');
  static Options put() => Options(method: 'PUT');
}

class RequestModel {
  final Map<String, dynamic>? headers;
  RequestModel({
    required this.options,
    this.data,
    this.onReceiveProgress,
    this.cancelToken,
    this.queryParameters,
    this.headers,
  });

  RequestModel.post({
    this.data,
    this.onReceiveProgress,
    this.cancelToken,
    this.queryParameters,
    this.headers,
  }) : options = HttpMethod.post();

  RequestModel.delete({
    this.data,
    this.onReceiveProgress,
    this.cancelToken,
    this.queryParameters,
    this.headers,
  }) : options = HttpMethod.delete();

  RequestModel.get({
    this.data,
    this.onReceiveProgress,
    this.cancelToken,
    this.queryParameters,
    this.headers,
  }) : options = HttpMethod.get();

  RequestModel.patch({
    this.data,
    this.onReceiveProgress,
    this.cancelToken,
    this.queryParameters,
    this.headers,
  }) : options = HttpMethod.patch();

  RequestModel.put({
    this.data,
    this.onReceiveProgress,
    this.cancelToken,
    this.queryParameters,
    this.headers,
  }) : options = HttpMethod.put();

  final Options options;
  final dynamic data;

  final Map<String, dynamic>? queryParameters;
  final CancelToken? cancelToken;
  final ProgressCallback? onReceiveProgress;
}
