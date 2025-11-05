class ApiUrl {
  // static const String _base = 'http://74.225.150.134:5000/api'; // port
  // static const String hubUrl =
  //     'http://74.225.150.134:5000/hubs/NotificationHub?userId='; // port

  static const String _base = 'https://apihrms.uisl.in/api';
  static const String hubUrl =
      'https://apihrms.uisl.in/hubs/NotificationHub?userId=';

  //----------------------->>  USER  <<-------------------------------
  static String login = '$_base/Account/Login';
  static String forgotPassword = '$_base/Account/ForgotPassword';
  static String getUserData = '$_base/Account/GetUserById';
  static String getUserProfileData = '$_base/Employee/';

  // mark attendance screen
  static String fetchAttendanceDateWise =
      '$_base/EmployeeAttendance/GetEmployeeAttendanceByDate?';
  static String punchInOut = '$_base/EmployeeAttendance';

  static String getMonthlyAttendance =
      '$_base/EmployeeAttendance/GetByMonthAndYearEmployeeAttendance?';
  static String getSalarySlip = '$_base/Payroll/GetEmployeeSalarySlip?';

  static String privacyPolicyUrl = 'https://hrmsuistech.in/privacypolicy';
  static String deleteAccountUrl = 'http://hrmsuistech.in/deleteaccount';
}
