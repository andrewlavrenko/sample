import 'package:flutter/material.dart';
import 'package:sample/core/utils/unglow_behavior.dart';
import 'package:sample/features/sample/presentation/widgets/sample_button.dart';

class SampleScreen2 extends StatelessWidget {
  const SampleScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sample Screen 2'),
        ),
        body: ScrollConfiguration(
          behavior: NoScrollBehavior(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('This is Sample 2'),
                SampleButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
