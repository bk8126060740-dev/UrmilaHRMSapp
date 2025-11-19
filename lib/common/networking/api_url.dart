class ApiUrl {
  // static const String _base = 'http://74.225.150.134:5000/api'; // port
  // static const String hubUrl =
  //     'http://74.225.150.134:5000/hubs/NotificationHub?userId='; // port

  static const String _base = 'http://74.225.150.134:1001/api'; // port
  static const String hubUrl =
      'http://74.225.150.134:1001/hubs/NotificationHub?userId='; // port

  static const String viewImageBase =
      'https://usiciprodsa.blob.core.windows.net/nirghosh-ems-docs-prod/'; // port

  //----------------------->>  USER  <<-------------------------------
  static String login = '$_base/Auth/login';
  static String forgotPassword = '$_base/Account/ForgotPassword';
  static String getUserData = '$_base/Account/GetUserById';
  static String getUserProfileData = '$_base/Employee/';

  // mark attendance screen
  static String checkIn = '$_base/Attendance/checkin';
  static String checkOut = '$_base/Attendance/checkout';

  static String fetchAttendanceDateWise =
      '$_base/Attendance/GetEmployeeAttendanceByDate?';

  static String getMonthlyAttendance =
      '$_base/calendar/month?';

  //------------ approve attendance by manager ---------------------
  static String getApproveAttendanceList =
      '$_base/Attendance/GetAttendanceByManagerID/';

  static String approveAttendanceByManager =
      '$_base/manager/attendance/record/ApproveAttendances_byAttendenceIds';

  static String getSalarySlip = '$_base/Payroll/GetEmployeeSalarySlip?';

  static String privacyPolicyUrl = 'https://hrmsuistech.in/privacypolicy';
  static String deleteAccountUrl = 'http://hrmsuistech.in/deleteaccount';
}
