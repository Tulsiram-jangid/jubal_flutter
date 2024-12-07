import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:my_app/utils/appColor.dart';

class AddActionWidget extends StatelessWidget {

  final VoidCallback onPressed;

  AddActionWidget({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    double size = 30;
    return TextButton(
      onPressed: onPressed,
      child: Center(
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(size),
          dashPattern: const [2, 2],
          color: Colors.white,
          strokeWidth: 2,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(size),
              ),
              child: const Icon(
                Icons.add,
                color: AppColor.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
