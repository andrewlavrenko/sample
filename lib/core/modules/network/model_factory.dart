// ignore_for_file: unused_local_variable, avoid_catches_without_on_clauses

import '../../error/exceptions.dart';

class ModelFactory {
  static T generateObject<T>(dynamic json) {
    assert(json != null, 'json is null');
    final type = T.toString();
    try {
      if (json == null) {
        throw ResponseException();
      //} else if (type == (Model).toString()) {
      //  return Model.fromJson(json) as T;
      } else if (type == 'String') {
        return json;
      } else if (type == 'int') {
        return json;
      } else {
        throw EntityException();
      }
    } catch (_) {
      throw EntityException();
    }
  }
}
