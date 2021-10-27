import 'package:clean_arch_expert/core/usecases/error/failure.dart';
import 'package:clean_arch_expert/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class DoLoginRepository {
  Future<Either<Failure, User>> doLogin(
      {required String email, required String password});
}
