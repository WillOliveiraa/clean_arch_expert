import 'package:clean_arch_expert/core/usecases/error/failure.dart';
import 'package:clean_arch_expert/features/auth/data/models/user_model.dart';

import 'do_login_datasource.dart';

class DoLoginDatasourceApi implements DoLoginDatasource {
  @override
  Future<UserModel> doLogin({required String email, required String password}) {
    try {
      return Future.value(UserModel.fromMap(tUserApi));
    } catch (e) {
      throw ServerFailure();
    }
  }
}

var tUserApi = {
  "name": "Will Oliveira",
  "bornDate": DateTime.now().toIso8601String(),
  "pictureUrl": "urlUser",
  "email": "email@teste.com",
};
