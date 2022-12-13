// ignore_for_file: prefer_const_constructors, always_put_control_body_on_new_line

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sample/core/modules/network/request.dart';

import '../../constants/defaults.dart';
import '../../error/exceptions.dart';
import '../../error/failures.dart';
//import '../../injectable/injectable_init.dart';
//import '../../usecases/usecase.dart';
import 'response.dart';

@Injectable()
class NetworkOptions {
  BaseOptions get options {
    final options = BaseOptions()
      ..baseUrl = Defaults.baseUrl
      ..connectTimeout = 10000
      ..receiveTimeout;
    return options;
  }
}

@Singleton()
class NetworkModule {
  final dio = Dio();
  final NetworkOptions _networkOptions;

  NetworkModule(this._networkOptions) {
    dio.options = _networkOptions.options;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 403 || error.response?.statusCode == 401) {
          //  final failureOrCredentials = await getIt<GetUserCredentials>().call(NoParams());
          //  await failureOrCredentials.fold(
          //    (failure) async => handler.next(error),
          //    (credentials) async {
          //      if (credentials != null) {
          //        final failureOrCredentials = await getIt<RefreshUserCredentials>().call(NoParams());
          //        await failureOrCredentials.fold(
          //          (failure) async => handler.next(error),
          //          (credentials) async {
          //            final optins = Options(
          //              method: error.requestOptions.method,
          //              headers: error.requestOptions.headers,
          //            );
          //            final response = await dio.request<dynamic>(
          //              error.requestOptions.path,
          //              data: error.requestOptions.data,
          //              queryParameters: error.requestOptions.queryParameters,
          //              options: optins,
          //            );
          //            return handler.resolve(response);
          //          },
          //        );
          //      }
          //    },
          //  );
          }
          return handler.next(error);
        },
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        logPrint: (object) => log(object.toString()),
      ),
    );
  }
}

@Singleton()
class NetworkClient {
  final Dio _client;
  NetworkClient(NetworkModule networkModule) : _client = networkModule.dio;

  Future<Either<Failure, None>> requestForNone<None>(String uri, RequestModel requestModel) async {
    final response = await request<None>(uri, requestModel);
    return response.fold((left) => Left(left), (data) => Right(data));
  }

  Future<Either<Failure, T>> requestForObject<T>(String uri, RequestModel requestModel) async {
    final response = await request<T>(uri, requestModel);
    return response.fold((left) => Left(left), (data) {
      try {
        if (data.toString().isEmpty) throw ResponseException();
        final parsed = SingleResponse<T>.fromJson(data);
        return Right(parsed.result);
      } on EntityException {
        return Left(JsonFailure());
      } on ResponseException {
        return Left(ServerFailure());
      } on Exception catch (_) {
        return Left(DioFailure());
      }
    });
  }

  Future<Either<Failure, List<T>>> requestForList<T>(String uri, RequestModel requestModel, {String? key}) async {
    final response = await request(uri, requestModel);
    return response.fold((left) => Left(left), (data) {
      try {
        if (data.toString().isEmpty) throw ResponseException();
        final parsed = ListResponse<T>.fromJson(data, key: key);
        if (parsed.results.isEmpty) throw EmptyListException();
        return Right(parsed.results);
      } on EntityException {
        return Left(JsonFailure());
      } on ResponseException {
        return Left(ServerFailure());
      } on EmptyListException {
        return Left(EmptyListFailure());
      } on Exception catch (_) {
        return Left(DioFailure());
      }
    });
  }

  Future<Either<Failure, dynamic>> request<T>(String uri, RequestModel requestModel) async {
    try {
      final response = await _client.request(
        uri,
        data: requestModel.data,
        queryParameters: requestModel.queryParameters,
        options: requestModel.options.copyWith(headers: requestModel.headers),
        cancelToken: requestModel.cancelToken,
        onReceiveProgress: requestModel.onReceiveProgress,
      );

      if (response.data != null) {
        if (T.toString() == (None).toString()) {
          return Right(None());
        }
        return Right(response.data);
      } else {
        return Left(JsonFailure());
      }
    } on DioError catch (error) {
      if (error.response?.statusCode == 404) {
        return Left(ServerFailure(code: error.response?.statusCode));
      } else if (error.response?.statusCode == 403) {
        return Left(AuthFailure(code: error.response?.statusCode));
      } else if (error.response?.statusCode == 500) {
        return Left(ServerFailure(code: error.response?.statusCode));
      } else if (error.type == DioErrorType.connectTimeout) {
        return Left(TimeoutFailure());
      }
      return Left(DioFailure(code: error.response?.statusCode));
    } on AuthException catch (_) {
      return Left(AuthFailure());
    } on Exception catch (_) {
      return Left(ServerFailure());
    }
  }
}
