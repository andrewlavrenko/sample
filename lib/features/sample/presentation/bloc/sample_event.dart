part of 'sample_bloc.dart';

@immutable
abstract class SampleEvent {}

class LoadSample extends SampleEvent {
  final String someone;
  LoadSample({required this.someone});
}