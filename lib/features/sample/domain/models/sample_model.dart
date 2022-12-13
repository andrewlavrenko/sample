import 'package:equatable/equatable.dart';

class SampleModel extends Equatable {
  final String argument1;
  final int argument2;
  const SampleModel({
    required this.argument1,
    required this.argument2,
  });

  factory SampleModel.fromJson(Map<String, dynamic> json) =>
      SampleModel(
        argument1: json['argument1'],
        argument2: json['argument2'],
      );

  @override
  List<Object?> get props => [
    argument1,
    argument2,
  ];
}

class SampleFileModel extends Equatable {
  final String filePath;
  final String module;
  const SampleFileModel({
    required this.filePath,
    required this.module,
  });

  @override
  List<Object?> get props => [
    filePath,
    module,
  ];
}