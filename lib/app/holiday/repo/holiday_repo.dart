import 'package:hrms_uis/app/holiday/models/holiday_list_model.dart';

import '../../../common/networking/api_url.dart';
import '../../../common/networking/common_repo.dart';
import '../../../common/networking/http_client.dart';

class HolidayRepo {
  // get holiday
  Future<ApiResponse<HolidayListModel>> getHoliday({
    int? empId,
    int? selectedYear,
  }) async {
    int year = selectedYear ?? DateTime.now().year;
    var url = HttpClient.createGetUrl(
      ApiUrl.getHolidayList,
      queryParams: {"year": "$year"},
    );
    try {
      var response = CommonRepository.getRequest(
        url: url,
        fromJson: (json) => HolidayListModel.fromJson(json!),
        params: {},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
