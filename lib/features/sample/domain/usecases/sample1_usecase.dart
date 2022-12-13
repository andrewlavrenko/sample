import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/sample_repository.dart';

@Injectable()
class SampleRequest1 implements UseCase<None, String> {
  final SampleRepository _repository;
  const SampleRequest1(this._repository);

  @override
  Future<Either<Failure, None>> call(String params) {
    return _repository.sampleRequest1(params);
  }
}
