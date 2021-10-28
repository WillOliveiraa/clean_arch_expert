import 'package:clean_arch_expert/features/auth/domain/entities/user.dart';

import 'do_login_datasource.dart';

class DoLoginDatasourceApi implements DoLoginDatasource {
  @override
  Future<User> doLogin({required String email, required String password}) {
    // TODO: implement doLogin
    throw UnimplementedError();
  }
}
