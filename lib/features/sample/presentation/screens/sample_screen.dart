import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sample/core/utils/unglow_behavior.dart';
import 'package:sample/features/sample/presentation/widgets/sample_button.dart';

import '../../../../core/injectable/injectable_init.dart';
import '../bloc/sample_bloc.dart';
import '../controller/sample_controller.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SampleBloc>()),
        ChangeNotifierProvider(create: (context) => SampleController()),
      ],
      child: Builder(
        builder: (context) {
          final bloc = BlocProvider.of<SampleBloc>(context);
          final controller = Provider.of<SampleController>(context, listen: false);
          return SafeArea(
            child: BlocBuilder<SampleBloc, SampleState>(
              builder: (context, state) {
                if (state is SampleInitial) {
                } else if (state is SampleLoaded) {
                } else if (state is SampleEmpty) {
                } else if (state is SampleError) {}
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Sample Screen 1'),
                  ),
                  body: ScrollConfiguration(
                    behavior: NoScrollBehavior(),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('This is Sample 1'),
                          SampleButton(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
