import 'package:auto_route/auto_route.dart';
import 'package:sample/features/sample/presentation/screens/sample_screen.dart';
import 'package:sample/routes/sample/sample_wrapper.dart';

import '../../features/sample/presentation/screens/sample_screen2.dart';



const sampleRouter = AutoRoute(
  name: 'MajorRouter',
  page: SampleWrapper,
  initial: true,
  children: [
    AutoRoute(page: SampleScreen, initial: true),
    AutoRoute(page: SampleScreen2),
  ],
);