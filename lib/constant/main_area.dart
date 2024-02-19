import 'package:flutter/material.dart';
import 'global_context.dart';

class MainArea extends StatelessWidget {
  static const _developerOriginSize = Size(392.7, 759.3);

  static double get height {
    final logicalPixel = MediaQuery.of(globalContext).size.height;
    final appBarSize = AppBar().preferredSize.height;
    final padding = MediaQuery.of(globalContext).padding.top +
        MediaQuery.of(globalContext).padding.bottom;
    return logicalPixel - appBarSize - padding;
  }

  static double get scale {
    final localSize = MediaQuery.of(globalContext).size;
    final scaleX = localSize.width / _developerOriginSize.width;
    final scaleY = localSize.height / _developerOriginSize.height;
    return (scaleX + scaleY) / 2;
  }

  const MainArea({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: child,
    );
  }
}
