class DateFormats {
  // ─────── yyyy-MM-dd Variants ───────
  static const String ymdDash = 'yyyy-MM-dd';                     // 2025-05-12
  static const String ymdDashTime12h = 'yyyy-MM-dd hh:mm a';     // 2025-05-12 02:30 PM
  static const String ymdDashTime24h = 'yyyy-MM-dd HH:mm';       // 2025-05-12 14:30

  // ─────── yyyy/MM/dd Variants ───────
  static const String ymdSlash = 'yyyy/MM/dd';                   // 2025/05/12
  static const String ymdSlashTime12h = 'yyyy/MM/dd hh:mm a';    // 2025/05/12 02:30 PM
  static const String ymdSlashTime24h = 'yyyy/MM/dd HH:mm';      // 2025/05/12 14:30

  // ─────── dd-MM-yyyy Variants ───────
  static const String dmyDash = 'dd-MM-yyyy';                    // 12-05-2025
  static const String dmyDashTime12h = 'dd-MM-yyyy hh:mm a';     // 12-05-2025 02:30 PM
  static const String dmyDashTime24h = 'dd-MM-yyyy HH:mm';       // 12-05-2025 14:30

  // ─────── dd/MM/yyyy Variants ───────
  static const String dmySlash = 'dd/MM/yyyy';                   // 12/05/2025
  static const String mdySlash = 'MM/dd/yyyy';                   // 12/05/2025
  static const String dmySlashTime12h = 'dd/MM/yyyy hh:mm a';    // 12/05/2025 02:30 PM
  static const String dmySlashTime24h = 'dd/MM/yyyy HH:mm';      // 12/05/2025 14:30

  // ─────── English Readable ───────
  static const String fullMonth = 'dd MMMM yyyy';                // 12 May 2025
  static const String fullMonthTime12h = 'dd MMMM yyyy hh:mm a'; // 12 May 2025 02:30 PM
  static const String fullMonthTime24h = 'dd MMMM yyyy HH:mm';   // 12 May 2025 14:30

  // ─────── Weekday Formats ───────
  static const String weekdayLong = 'EEEE, dd MMMM yyyy';               // Monday, 12 May 2025
  static const String weekdayLongTime12h = 'EEEE, dd MMMM yyyy hh:mm a'; // Monday, 12 May 2025 02:30 PM
  static const String weekdayLongTime24h = 'EEEE, dd MMMM yyyy HH:mm';   // Monday, 12 May 2025 14:30

  // ─────── ISO-like ───────
  static const String isoWithTime = 'yyyy-MM-ddTHH:mm:ss';       // 2025-05-12T14:30:00
}
