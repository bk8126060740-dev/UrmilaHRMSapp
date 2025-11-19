import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import '../../../common/utils/constants/decorations.dart';

class LeaveHistoryItem extends StatelessWidget {
  final Map<String, dynamic> item;

  const LeaveHistoryItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    String type = item["type"];
    String from = item["from"];
    String to = item["to"];
    String durationType = item["durationType"];
    String status = item["status"];

    /// ----- Status Badge Color -----
    Color statusColor = status == "Approved"
        ? Colors.green
        : status == "Pending"
        ? Colors.orange
        : Colors.red;

    /// ----- Leave Type Color -----
    Color typeColor = type == "Paid Leave"
        ? Colors.blue
        : type == "Casual Leave"
        ? Colors.deepPurple
        : type == "Sick Leave"
        ? Colors.deepOrange
        : Colors.indigo;

    /// ----- Date Text (Single vs Multi-Day) -----
    String dateText = (from == to) ? "$from ($durationType)" : "$from → $to";

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: AppDecorations.card().copyWith(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Colored side strip
          Container(
            width: 5,
            height: 60,
            decoration: BoxDecoration(
              color: typeColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          const SizedBox(width: 12),

          /// Main Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Leave Type
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: typeColor,
                  ),
                ),

                const SizedBox(height: 4),

                /// Date Range
                Text(
                  dateText,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),

                const SizedBox(height: 6),

                /// Duration Type (Only show when multi-day OR single-day without equal range)
                if (from != to)
                  Text(
                    "Duration: $durationType",
                    style: const TextStyle(fontSize: 13, color: Colors.black87),
                  ),
              ],
            ),
          ),

          /// Status Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor.withFixedOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: statusColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
