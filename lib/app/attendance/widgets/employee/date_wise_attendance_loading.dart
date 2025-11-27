import 'package:flutter/material.dart';

import '../../../../common/widgets/loader/shimmer_loading.dart';
import 'clock_in_out_card.dart';

class DateWiseAttendanceLoading extends StatelessWidget {
  const DateWiseAttendanceLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        6,
        (index) => ShimmerLoading(
          isLoading: true,
          child: ClockInOutCard(
            duration: "—",
            clockIn: "—",
            clockOut: "—",
            location: "—",
            attendanceData: null,
          ),
        ),
      ),
    );
  }
}

class MarkAttendanceCardSkeleton extends StatelessWidget {
  const MarkAttendanceCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // ✅ transparent background
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Duration Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLine(width: 80, height: 12),
              _buildLine(width: 60, height: 12),
            ],
          ),
          const SizedBox(height: 20),

          // Clock In / Clock Out
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_buildClockPlaceholder(), _buildClockPlaceholder()],
          ),
          const SizedBox(height: 20),

          // Divider
          Container(height: 1, color: Colors.grey.shade300),
          const SizedBox(height: 20),

          // Location Row
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(child: _buildLine(width: double.infinity, height: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildClockPlaceholder() {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade300,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLine(width: 40, height: 10),
            const SizedBox(height: 6),
            _buildLine(width: 60, height: 10),
          ],
        ),
      ],
    );
  }

  Widget _buildLine({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
