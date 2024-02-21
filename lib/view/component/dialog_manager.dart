import 'package:flutter/material.dart';
import 'package:twelve_hours/constant/global_context.dart';
import 'package:twelve_hours/view/component/gradient_button.dart';

import '../../constant/color_palette.dart';

class DialogManager {
  static void show({
    required String title,
    required String content,
    required String okButtonLabel,
    required void Function()? onOkPressed,
  }) {
    showDialog(
      context: globalContext,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: ColorPalette.purplePinkGradient,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: GradientButton(
                      okButtonLabel,
                      size: GradientButtonSize.small,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
