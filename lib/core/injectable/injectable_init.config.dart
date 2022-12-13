// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/sample/data/repository/sample_repository_impl.dart'
    as _i6;
import '../../features/sample/data/source/sample_source.dart' as _i4;
import '../../features/sample/domain/repository/sample_repository.dart' as _i5;
import '../../features/sample/domain/usecases/sample1_usecase.dart' as _i7;
import '../../features/sample/domain/usecases/sample2_usecase.dart' as _i8;
import '../../features/sample/domain/usecases/sample3_usecase.dart' as _i9;
import '../../features/sample/domain/usecases/sample4_usecase.dart' as _i10;
import '../../features/sample/domain/usecases/sample5_usecase.dart' as _i11;
import '../../features/sample/presentation/bloc/sample_bloc.dart' as _i12;
import '../modules/network/network_module.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.NetworkOptions>(() => _i3.NetworkOptions());
  gh.singleton<_i3.NetworkModule>(_i3.NetworkModule(get<_i3.NetworkOptions>()));
  gh.singleton<_i3.NetworkClient>(_i3.NetworkClient(get<_i3.NetworkModule>()));
  gh.factory<_i4.SampleSource>(
      () => _i4.SampleSource(get<_i3.NetworkClient>()));
  gh.factory<_i5.SampleRepository>(
      () => _i6.SampleRepositoryImpl(get<_i4.SampleSource>()));
  gh.factory<_i7.SampleRequest1>(
      () => _i7.SampleRequest1(get<_i5.SampleRepository>()));
  gh.factory<_i8.SampleRequest2>(
      () => _i8.SampleRequest2(get<_i5.SampleRepository>()));
  gh.factory<_i9.SampleRequest3>(
      () => _i9.SampleRequest3(get<_i5.SampleRepository>()));
  gh.factory<_i10.SampleRequest4>(
      () => _i10.SampleRequest4(get<_i5.SampleRepository>()));
  gh.factory<_i11.SampleRequest5>(
      () => _i11.SampleRequest5(get<_i5.SampleRepository>()));
  gh.factory<_i12.SampleBloc>(
      () => _i12.SampleBloc(get<_i10.SampleRequest4>()));
  return get;
}
