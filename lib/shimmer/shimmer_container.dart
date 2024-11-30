import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  final Widget child;

  ShimmerContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: child,
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade400,
    );
  }
}
