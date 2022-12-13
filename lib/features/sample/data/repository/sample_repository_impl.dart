import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sample/core/error/failures.dart';
import 'package:sample/features/sample/domain/models/sample_model.dart';

import '../../domain/repository/sample_repository.dart';
import '../source/sample_source.dart';

@Injectable(as: SampleRepository)
class SampleRepositoryImpl extends SampleRepository {
  final SampleSource _source;
  SampleRepositoryImpl(this._source);

  @override
  Future<Either<Failure, None>> sampleRequest1(String someone) {
    return _source.sampleRequest1(someone);
  }

  @override
  Future<Either<Failure, String>> sampleRequest2(String someone) {
    return _source.sampleRequest2(someone);
  }

  @override
  Future<Either<Failure, List<String>>> sampleRequest3() {
    return _source.sampleRequest3();
  }

  @override
  Future<Either<Failure, SampleModel>> sampleRequest4(String someone) {
    return _source.sampleRequest4(someone);
  }

  @override
  Future<Either<Failure, String>> sampleRequest5(SampleFileModel data) {
    return _source.sampleRequest5(data.filePath, data.module);
  }
}