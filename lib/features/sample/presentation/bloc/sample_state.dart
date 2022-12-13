part of 'sample_bloc.dart';

@immutable
abstract class SampleState {}

class SampleInitial extends SampleState {}

class SampleEmpty extends SampleState {}

class SampleLoading extends SampleState {}

class SampleLoaded extends SampleState {
  final SampleModel sample;
  SampleLoaded({required this.sample});
}

class SampleError extends SampleState {
  final Failure failure;
  SampleError({required this.failure});
}