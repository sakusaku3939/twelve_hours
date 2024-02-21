import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constant/color_palette.dart';

enum GradientButtonSize {
  small,
  medium,
}

class GradientButton extends HookConsumerWidget {
  const GradientButton(
    this.text, {
    super.key,
    this.size = GradientButtonSize.medium,
    this.onPressed,
  });

  final String text;
  final GradientButtonSize size;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final double width;
    late final double padding;
    late final double fontSize;

    switch (size) {
      case GradientButtonSize.small:
        width = double.infinity;
        padding = 4;
        fontSize = 16;
        break;
      case GradientButtonSize.medium:
        width = 200;
        padding = 8;
        fontSize = 18;
        break;
    }
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
        gradient: ColorPalette.purplePinkGradient,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: padding),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
