import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sample/features/sample/domain/models/sample_model.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecases/sample4_usecase.dart';

part 'sample_event.dart';
part 'sample_state.dart';

@Injectable()
class SampleBloc extends Bloc<SampleEvent, SampleState> {
  final SampleRequest4 _request4;
  SampleBloc(this._request4) : super(SampleInitial()) {
    on<LoadSample>(_onLoadSampleEvent);
  }

  Future<void> _onLoadSampleEvent(
      LoadSample event, Emitter<SampleState> emit) async {
    emit(SampleLoading());
    final failureOrGoal = await _request4.call(event.someone);
    failureOrGoal.fold(
      (failure) => emit(SampleError(failure: failure)),
      (sample) => emit(SampleLoaded(sample: sample)),
    );
  }
}
