import 'package:clean_arch_expert/features/auth/data/models/user_model.dart';

abstract class DoLoginDatasource {
  Future<UserModel> doLogin({required String email, required String password});
}
