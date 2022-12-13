import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/sample_repository.dart';

@Injectable()
class SampleRequest2 implements UseCase<String, String> {
  final SampleRepository _repository;
  const SampleRequest2(this._repository);

  @override
  Future<Either<Failure, String>> call(String params) {
    return _repository.sampleRequest2(params);
  }
}
