import 'package:flutter/material.dart';
import 'package:twelve_hours/model/database_table.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';

import '../../constant/color_palette.dart';

class ProgressTimer extends StatefulWidget {
  const ProgressTimer({
    super.key,
    required this.room,
  });

  final RoomTable room;

  @override
  ProgressTimerState createState() => ProgressTimerState();
}

class ProgressTimerState extends State<ProgressTimer>
    with TickerProviderStateMixin {
  late AnimationController controller;
  final twelveHours = DateTime.now().add(const Duration(hours: 12));

  String get timerText {
    Duration duration = controller.duration! * controller.value;
    String hours = duration.inHours.toString().padLeft(2, '0');
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  void initState() {
    super.initState();
    Duration remainingTime = twelveHours.difference(widget.room.date);
    if (remainingTime.inSeconds > 0) {
      controller = AnimationController(
        vsync: this,
        duration: remainingTime,
      );
      controller.reverse(from: 1.0);
    } else {
      // TODO 12時間を過ぎた場合の処理
    }
    controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        print('Animation completed');
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    "${DateFormat('yyyy/MM/dd').format(widget.room.date)} のルーム",
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
                        timerText,
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
