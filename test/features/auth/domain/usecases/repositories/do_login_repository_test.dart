import 'package:clean_arch_expert/core/usecases/error/failure.dart';
import 'package:clean_arch_expert/features/auth/data/datasources/do_login_datasource.dart';
import 'package:clean_arch_expert/features/auth/data/models/user_model.dart';
import 'package:clean_arch_expert/features/auth/data/repositories/do_login_repository_impl.dart';
import 'package:clean_arch_expert/features/auth/domain/repositories/do_login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DoLoginDatasourceMock extends Mock implements DoLoginDatasource {}

void main() {
  DoLoginDatasource _datasource = DoLoginDatasourceMock();
  DoLoginRepository _repository = DoLoginRepositoryImpl(_datasource);

  test("Deve realizar o login", () async {
    when(() => _datasource.doLogin(
        email: any(named: "email"),
        password: any(named: "password"))).thenAnswer((_) async => tUser);

    var result =
        await _repository.doLogin(email: tUser.email, password: "123123");

    expect(result, isA<Right>());
    expect(result, Right(tUser));
    verify(() => _datasource.doLogin(email: tUser.email, password: "123123"))
        .called(1);
    verifyNoMoreInteractions(_datasource);
  });

  test("Deve obeter erro ao realizar o login", () async {
    when(() => _datasource.doLogin(
        email: any(named: "email"),
        password: any(named: "password"))).thenThrow(PasswordWrongFailure());

    var result =
        await _repository.doLogin(email: tUser.email, password: "123123");

    expect(result, isA<Left>());
    expect(result, Left(PasswordWrongFailure()));
    verify(() => _datasource.doLogin(email: tUser.email, password: "123123"))
        .called(1);
    verifyNoMoreInteractions(_datasource);
  });
}

var tUser = UserModel(
  name: "Nome user",
  email: "email@teste.com",
  bornDate: DateTime.now(),
  pictureUrl: "urlUser",
);
