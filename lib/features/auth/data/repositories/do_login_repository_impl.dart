import 'package:clean_arch_expert/features/auth/data/datasources/do_login_datasource.dart';
import 'package:clean_arch_expert/features/auth/domain/entities/user.dart';
import 'package:clean_arch_expert/core/usecases/error/failure.dart';
import 'package:clean_arch_expert/features/auth/domain/repositories/do_login_repository.dart';
import 'package:dartz/dartz.dart';

class DoLoginRepositoryImpl implements DoLoginRepository {
  final DoLoginDatasource _datasource;

  DoLoginRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, User>> doLogin(
      {required String email, required String password}) async {
    try {
      var result = await _datasource.doLogin(email: email, password: password);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
