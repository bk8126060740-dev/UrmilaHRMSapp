class DurationFormatter {
  // Convert a string like "07:53:32.2751740" or "01:05:00" to Duration
  static Duration? parseDuration(String? value) {
    if (value == null || value.isEmpty) return null;

    try {
      final parts = value.split(':');
      if (parts.length < 2) return null;

      final hours = int.tryParse(parts[0]) ?? 0;
      final minutes = int.tryParse(parts[1]) ?? 0;

      // Handle seconds with fractional part
      final secondsPart = parts.length > 2 ? parts[2] : '0';
      final seconds = double.tryParse(secondsPart) ?? 0.0;

      return Duration(
        hours: hours,
        minutes: minutes,
        seconds: seconds.floor(),
        milliseconds: ((seconds - seconds.floor()) * 1000).round(),
      );
    } catch (_) {
      return null;
    }
  }

  /// Format Duration to "HH:mm:ss" or "Hh Mm Ss"
  static String formatDuration(
    String? durationString, {
    bool showUnits = false,
  }) {
    final duration = parseDuration(durationString);
    if (duration == null) return "--:--";

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (showUnits) {
      // Example: "7h 53m 32s"
      return "${hours}h ${minutes}m ${seconds}s";
    } else {
      // Example: "07:53:32"
      return "${hours.toString().padLeft(2, '0')}:"
          "${minutes.toString().padLeft(2, '0')}:"
          "${seconds.toString().padLeft(2, '0')}";
    }
  }
}
