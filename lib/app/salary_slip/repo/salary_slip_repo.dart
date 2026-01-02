import 'dart:developer';
import 'dart:io';

import 'package:hrms_uis/common/networking/api_url.dart';
import '../../../common/networking/http_client.dart';

typedef DownloadProgress = void Function(double progress);

class SalarySlipRepo {
  Future<File?> downloadSalarySlip({
    required DownloadProgress onProgress,
    int? empId,
    String? year,
    String? month,
  }) async {
    final url = HttpClient.createGetUrl(
      ApiUrl.downloadPaySlip,
      queryParams: {
        "EmployeeId": empId?.toString() /*"19945"*/,
        "Month": month,
        "Year": year,
      },
    );

    log("[SalarySlipRepo] Download URL => $url", name: "SalarySlipRepo");

    try {
      final file = await HttpClient.instance().downloadFile(
        url: url,
        onProgress: (progress) {
          log(
            "[SalarySlipRepo] Download progress => ${(progress * 100).toStringAsFixed(0)}%",
            name: "SalarySlipRepo",
          );
          onProgress(progress);
        },
      );

      log(
        "[SalarySlipRepo] File downloaded at => ${file?.path}",
        name: "SalarySlipRepo",
      );

      return file;
    } catch (e) {
      log("[SalarySlipRepo] Download failed => $e", name: "SalarySlipRepo");

      // 👇 VERY IMPORTANT: let Bloc receive the exact backend error
      rethrow;
    }
  }
}
