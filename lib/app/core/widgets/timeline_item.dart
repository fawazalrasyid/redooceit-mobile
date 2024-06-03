import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineItem extends StatelessWidget {
  const TimelineItem({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isActive,
    required this.isPrev,
    required this.stepName,
  });

  final bool isFirst;
  final bool isLast;
  final bool isActive;
  final bool isPrev;
  final String stepName;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      axis: TimelineAxis.horizontal,
      alignment: TimelineAlign.center,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        indicator: Container(
          width: 26,
          height: 26,
          padding: const EdgeInsets.all(4),
          decoration: ShapeDecoration(
            color: isActive
                ? const Color(0xFFFDF1E0)
                : isPrev
                    ? const Color(0xFFDAFFFB)
                    : const Color(0xFFEEF3F7),
            shape: const OvalBorder(),
          ),
          child: Container(
            decoration: ShapeDecoration(
              color: isActive
                  ? const Color(0xFFFBA536)
                  : isPrev
                      ? const Color(0xFF32D0C3)
                      : const Color(0xFF5F7588),
              shape: const OvalBorder(),
            ),
          ),
        ),
      ),
      endChild: Container(
        padding: const EdgeInsets.all(4),
        child: Text(
          stepName,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(
            color: isActive ? const Color(0xFFFBA536) : const Color(0xFF130F26),
            fontSize: 14,
            fontFamily: 'DM Sans',
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      ),
      beforeLineStyle: const LineStyle(
        color: Color(0xFFCCDCE9),
        thickness: 1,
      ),
    );
  }
}
