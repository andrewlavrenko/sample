import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../models/sample_model.dart';
import '../repository/sample_repository.dart';

@Injectable()
class SampleRequest4 implements UseCase<SampleModel, String> {
  final SampleRepository _repository;
  const SampleRequest4(this._repository);

  @override
  Future<Either<Failure, SampleModel>> call(String params) {
    return _repository.sampleRequest4(params);
  }
}
