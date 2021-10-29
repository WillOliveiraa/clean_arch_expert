import 'package:clean_arch_expert/core/usecases/error/failure.dart';
import 'package:clean_arch_expert/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';

import 'do_login_datasource.dart';

class DoLoginDatasourceApi implements DoLoginDatasource {
  final Dio _dio;

  DoLoginDatasourceApi(this._dio);

  @override
  Future<UserModel> doLogin(
      {required String email, required String password}) async {
    try {
      var response = await _dio.post("http://www.api.com/user",
          data: {"email": email, "password": password});

      return UserModel.fromMap(response.data);

      // return Future.value(UserModel.fromMap(tkUserApi));
    } catch (e) {
      throw ServerFailure();
    }
  }
}

var tkUserApi = {
  "name": "Nome",
  "bornDate": DateTime(2021, 6, 1).toIso8601String(),
  "pictureUrl": "https://test.com/photo.png",
  "email": "email@email.com"
};
