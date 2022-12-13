import 'package:dartz/dartz.dart';
import 'package:sample/features/sample/domain/models/sample_model.dart';

import '../../../../core/error/failures.dart';

abstract class SampleRepository {
  Future<Either<Failure, None>> sampleRequest1(String someone);
  Future<Either<Failure, String>> sampleRequest2(String someone);
  Future<Either<Failure, List<String>>> sampleRequest3();
  Future<Either<Failure, SampleModel>> sampleRequest4(String someone);
  Future<Either<Failure, String>> sampleRequest5(SampleFileModel data);

}