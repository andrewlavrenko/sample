import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../models/sample_model.dart';
import '../repository/sample_repository.dart';

@Injectable()
class SampleRequest5 implements UseCase<String, SampleFileModel> {
  final SampleRepository _repository;
  const SampleRequest5(this._repository);

  @override
  Future<Either<Failure, String>> call(SampleFileModel params) {
    return _repository.sampleRequest5(params);
  }
}
