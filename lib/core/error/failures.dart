import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get message;
  int? get code;

  String get statusCode => code != null ? ' Код: $code' : '';

  @override
  List<Object> get props => [];
}

class NotFoundFailure extends Failure {
  @override
  final int? code;
  final String? text;
  NotFoundFailure({this.code, this.text});

  @override
  String get message => text ?? 'Страница не найдена.';
}

class ServerFailure extends Failure {
  @override
  final int? code;
  final String? text;
  ServerFailure({this.code, this.text});

  @override
  String get message => text ?? 'Ошибка сервера.$statusCode';
}

class TimeoutFailure extends Failure {
  @override
  final int? code;
  final String? text;
  TimeoutFailure({this.code, this.text});
  @override
  String get message => text ?? 'Сервер не отвечает.$statusCode';
}

class CacheFailure extends Failure {
  @override
  final int? code;
  final String? text;
  CacheFailure({this.code, this.text});

  @override
  String get message => text ?? 'Ошибка кэша.$statusCode';
}

class DioFailure extends Failure {
  @override
  final int? code;
  final String? text;
  DioFailure({this.code, this.text});

  @override
  String get message => text ?? 'Ошибка запроса.$statusCode';
}

class JsonFailure extends Failure {
  @override
  final int? code;
  final String? text;
  JsonFailure({this.code, this.text});

  @override
  String get message => text ?? 'Ошибка приложения.$statusCode';
}

class AuthFailure extends Failure {
  @override
  final int? code;
  final String? text;
  AuthFailure({this.code, this.text});

  @override
  String get message => text ?? 'Вы не авторизованы.$statusCode';
}

class EmptyListFailure extends Failure {
  @override
  final int? code;
  final String? text;
  EmptyListFailure({this.code, this.text});

  @override
  String get message => text ?? 'Пустой список.$statusCode';
}
