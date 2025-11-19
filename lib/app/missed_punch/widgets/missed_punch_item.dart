import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../common/utils/constants/decorations.dart';

class MissedPunchItem extends StatelessWidget {
  final Map<String, dynamic> item;

  const MissedPunchItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    String type = item["type"]; // Regularization / Missing Punch
    String category =
        item["category"]; // Early Coming / Late Going / Missing Punch
    String requestDate = item["requestDate"]; // 12 Jan 2025
    String mode = item["mode"]; // In / Out / Both
    String? inTime = item["inTime"]; // 09:30 AM
    String? outTime = item["outTime"]; // 06:40 PM
    String status = item["status"]; // Approved / Reject / Pending

    /// Status Color
    Color statusColor = status == "Approved"
        ? Colors.green
        : status == "Pending"
        ? Colors.orange
        : Colors.red;

    /// Side strip color based on Category
    Color stripColor = category == "Early Coming"
        ? Colors.blue
        : category == "Late Going"
        ? Colors.indigo
        : category == "New Joinee"
        ? Colors.teal
        : Colors.deepPurple;

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
            height: 70,
            decoration: BoxDecoration(
              color: stripColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          const SizedBox(width: 12),

          /// ---- Main Content ----
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Type (Regularization / Missing Punch)
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: stripColor,
                  ),
                ),

                const SizedBox(height: 4),

                /// Category + Date
                Text(
                  "$category • $requestDate",
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),

                const SizedBox(height: 8),

                /// Mode & Time Details
                Row(
                  children: [
                    Text(
                      "Mode: $mode",
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                /// In & Out Times
                Row(
                  children: [
                    if (inTime != null)
                      Text(
                        "In: $inTime",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    if (mode == "Both" && outTime != null) ...[
                      const SizedBox(width: 12),
                      Text(
                        "Out: $outTime",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),

          /// ---- Status Badge ----
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor.withFixedOpacity(0.12),
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
