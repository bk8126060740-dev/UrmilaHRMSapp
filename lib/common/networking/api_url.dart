class ApiUrl {
  // static const String _base = 'http://74.225.150.134:1001/api'; // UAT
  // static const String _base2 = 'http://74.225.150.134:5050/api'; // UAT
  // static const String _base = 'http://192.168.1.190:2026/api'; // DEV

  static const String _base = 'http://74.225.150.134:1001/api'; // UAT app apis
  static const String _base2 = 'http://74.225.150.134:5050/api'; // UAT salary slip apis

  // static const String _baseFrontWeb = 'http://192.168.1.190:2026'; // DEV
  static const String _baseFrontWeb = 'http://74.225.150.134:5051'; // UAT view front end page delete ac and privacy policy

  static const String viewImageBase =
      'https://usiciprodsa.blob.core.windows.net/nirghosh-ems-docs-prod/'; // port

  //----------------------->>  USER  <<-------------------------------
  static String login = '$_base/Auth/login';
  static String forgotPassword = '$_base/Account/ForgotPassword';
  static String getUserData = '$_base/Account/GetUserById';
  static String getUserProfileData = '$_base/Employee/';

  // mark attendance screen
  static String checkIn = '$_base/Attendance/checkin';

  // static String checkOut = '$_base/Attendance/checkoutMultiple';
  static String checkOut = '$_base/Attendance/checkout';

  static String fetchAttendanceDateWise =
      '$_base/Attendance/GetEmployeeAttendanceByDate?';

  static String getMonthlyAttendance = '$_base/calendar/month?';

  //------------ approve attendance by manager ---------------------
  static String getApproveAttendanceList =
      '$_base/Attendance/GetAttendanceByManagerID/';

  // static String approveAttendanceByManager =
  //     '$_base/manager/attendance/record/ApproveAttendances_byAttendenceIds';

  static String approveAttendanceByManager =
      '$_base/manager/attendance/ApproveAttendances_byAttendenceIds';

  static String getMangersEmployeesList =
      '$_base/Employee/GetEmployeeListByManagerID?reportingManagerId=';

  // ======================>> LEAVE MANAGEMENT <<==============================
  static String getLeaveTypeBalanceData =
      '$_base/Leave/GetLeaveBailanceByEmployeeId?empId=';
  static String applyLeave = '$_base/Leave/apply';
  static String getEmployeeLeaveData = '$_base/Leave/LeaveByEmployeeId?empId=';
  static String cancelEmployeeLeave = '$_base/Leave/CancelLeave/';
  static String getApproveLeaveList = '$_base/Leave/GetLeaveByManagerID/';
  static String approveLeaveByManager =
      '$_base/Leave/record/ApproveLeaves_byLeaveIds';

  // missed punch apis
  static String getMissedPunchType = '$_base/Code/SwipeTypeList';
  static String applyMissedPunch = '$_base/Attendance/SwipeRequest';
  static String getEmployeesMissedPunchList =
      '$_base/Attendance/GetSwipeRequest/';

  // manager missed punch
  static String getApproveMissedPunchList =
      '$_base/Attendance/SwipeRequestByManagerID/';
  static String approveMissedPunchByManager =
      '$_base/Attendance/SwipeApprove_bySwipeIds';

  // ess tab
  static String downloadPaySlip = '$_base2/Payroll/GetEmployeeSalarySlip';

  static String getLatestVersion = '$_base/AppVersion/LatestVersion';

  // profile tab
  // static String privacyPolicy = '$_baseFrontWeb/privacypolicy';
  static String privacyPolicy = 'https://buntyuistech.github.io/hrms-privacy-policy/';

  static String deleteAccount = '$_baseFrontWeb/deleteaccount';

  // holiday
  static String getHolidayList = '$_base/calendar/HolidaysList';
}
