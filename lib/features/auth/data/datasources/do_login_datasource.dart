import 'package:clean_arch_expert/features/auth/domain/entities/user.dart';

abstract class DoLoginDatasource {
  Future<User> doLogin({required String email, required String password});
}
