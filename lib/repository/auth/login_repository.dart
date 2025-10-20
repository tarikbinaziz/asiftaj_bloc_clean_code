import 'package:asiftaj_bloc_clean_code/config/app_url.dart';
import 'package:asiftaj_bloc_clean_code/data/network/base_api_services.dart';
import 'package:asiftaj_bloc_clean_code/data/network/network_services_api.dart';
import 'package:asiftaj_bloc_clean_code/models/user/user_model.dart';

class LoginRepository {
  final BaseApiServices _apiServices = NetworkServicesApi();

  Future<UserModel> login(dynamic data) async {
    final response = await _apiServices.postApi(AppUrl.loginUrl, data);
    return UserModel.fromJson(response);
  }
}
