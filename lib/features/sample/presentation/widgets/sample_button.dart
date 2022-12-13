import 'package:flutter/material.dart';
import 'package:sample/generated/colors.gen.dart';

import '../dialogs/sample_dialog.dart';

class SampleButton extends StatelessWidget {
  const SampleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (dialogContext) => const SampleDialog(),
        );
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorName.black,
        ),
        child: const Center(
          child: Text(
            'Sample Button',
            style: TextStyle(color: ColorName.white),
          ),
        ),
      ),
    );
  }
}
