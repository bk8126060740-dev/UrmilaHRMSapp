import '../../../common/networking/api_url.dart';
import '../../../common/networking/common_repo.dart';
import '../model/login_response_model.dart';

class AuthRepo {
  Future<ApiResponse<LoginResponseModel>> login({
    required String password,
    required String userName,
  }) async {
    try {
      var response = CommonRepository.postRequest(
        url: ApiUrl.login,
        request: {"userName": userName, "password": password, "platform": 2},
        fromJson: (json) => LoginResponseModel.fromJson(json!),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
