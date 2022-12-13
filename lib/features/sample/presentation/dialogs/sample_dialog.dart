import 'package:flutter/material.dart';

import '../../../../core/constants/defaults.dart';

class SampleDialog extends StatelessWidget {
  const SampleDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: Defaults.borderRadius),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Sample Dialog'),
      ),
    );
  }
}
