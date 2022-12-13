import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/sample_repository.dart';

@Injectable()
class SampleRequest3 implements UseCase<List<String>, NoParams> {
  final SampleRepository _repository;
  const SampleRequest3(this._repository);

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) {
    return _repository.sampleRequest3();
  }
}
