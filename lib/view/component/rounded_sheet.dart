import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twelve_hours/constant/color_palette.dart';

import '../../viewmodel/rounded_sheet/rounded_sheet_viewmodel.dart';

class RoundedSheet extends HookConsumerWidget {
  const RoundedSheet({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sheetNotifier = ref.watch(roundedSheetProvider.notifier);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0,
        minChildSize: 0,
        controller: sheetNotifier.controller,
        snap: true,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  offset: Offset(0, 1),
                  blurRadius: 4,
                )
              ],
            ),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                // スクロール時のエフェクトをoffにする
                overscroll.disallowIndicator();
                return true;
              },
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    _dragHandle(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: child,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _dragHandle() {
    return Container(
      width: 32,
      height: 4,
      margin: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        color: ColorPalette.grey,
      ),
    );
  }
}
