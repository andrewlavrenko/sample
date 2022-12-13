

import '../../error/exceptions.dart';
import 'model_factory.dart';

class SingleResponse<T> {
  SingleResponse({required this.result});
  factory SingleResponse.fromJson(json) {
    try {
      if (json != null) {
        final res = ModelFactory.generateObject<T>(json['result']);
        return SingleResponse(result: res);
      } else {
        throw ResponseException();
      }
    } on Exception {
      rethrow;
    }
  }

  T result;

  @override
  String toString() {
    return 'SingleResponse{result: $result';
  }
}

class ListResponse<T> {
  ListResponse({required this.results});
  factory ListResponse.fromJson(Map<String, dynamic>? json, {String? key = 'result'}) {
    try {
      if (json != null) {
        final results = <T>[];
        final list = key != null ? json[key] : json;
        if (list is List) {
          for (final v in list) {
            results.add(ModelFactory.generateObject<T>(v));
          }
          return ListResponse(results: results);
        } else {
          throw EntityException();
        }
      } else {
        throw ResponseException();
      }
    } on Exception {
      rethrow;
    }
  }
  List<T> results;

  @override
  String toString() => 'ListResponse{result: $results';
}
