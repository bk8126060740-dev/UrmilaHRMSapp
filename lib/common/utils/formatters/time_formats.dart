class TimeFormats {
  // ─────── 12-Hour Formats ───────
  static const String time12h = 'hh:mm a'; // 02:30 PM
  static const String time12hWithSeconds = 'hh:mm:ss a'; // 02:30:45 PM

  // ─────── 24-Hour Formats ───────
  static const String time24h = 'HH:mm'; // 14:30
  static const String time24hWithSeconds = 'HH:mm:ss'; // 14:30:45

  // ─────── ISO / Technical Formats ───────
  static const String isoTime = 'HH:mm:ss.SSS'; // 14:30:45.123
  static const String isoFull = 'yyyy-MM-ddTHH:mm:ss'; // 2025-11-11T14:30:00
}
