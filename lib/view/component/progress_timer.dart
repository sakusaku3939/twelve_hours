import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twelve_hours/model/database_table.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:twelve_hours/viewmodel/room_card/room_card_viewmodel.dart';

import '../../constant/color_palette.dart';

class ProgressTimer extends HookConsumerWidget {
  const ProgressTimer({
    super.key,
    required this.room,
  });

  final RoomTable room;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diffInSeconds = DateTime.now().difference(room.date).inSeconds;
    final percentTimeRemaining = 1 - diffInSeconds / (12 * 60 * 60);

    final tickerProvider = useSingleTickerProvider();
    final controller = useAnimationController(
      vsync: tickerProvider,
      duration: const Duration(hours: 12),
    )..reverse(from: percentTimeRemaining);

    useEffect(() {
      void listener(AnimationStatus status) {
        // 12時間のアニメーション完了時
        if (status == AnimationStatus.dismissed) {
          ref.read(roomCardProvider.notifier).fetchMatchingResults();
        }
      }

      controller.addStatusListener(listener);
      return () => controller.removeStatusListener(listener);
    }, [controller]);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, Widget? child) {
                  return CustomPaint(
                    painter: TimerPainter(
                      animation: controller,
                      backgroundColor: Colors.white,
                      color: ColorPalette.pink,
                    ),
                  );
                },
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${DateFormat('yyyy/MM/dd').format(room.date)} のルーム",
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1.3,
                      color: ColorPalette.lightGray,
                    ),
                  ),
                  AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, Widget? child) {
                      return Text(
                        timerText(controller),
                        style: const TextStyle(
                          fontSize: 40,
                          height: 1.2,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String timerText(AnimationController controller) {
    final Duration duration = controller.duration! * controller.value;
    final String hours = duration.inHours.toString().padLeft(2, '0');
    final String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }
}

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double>? animation;
  final Color? backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor!
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color!;
    double progress = animation!.value * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter oldDelegate) {
    return animation!.value != oldDelegate.animation!.value ||
        color != oldDelegate.color ||
        backgroundColor != oldDelegate.backgroundColor;
  }
}
