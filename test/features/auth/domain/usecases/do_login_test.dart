import 'package:clean_arch_expert/features/auth/domain/entities/user.dart';
import 'package:clean_arch_expert/features/auth/domain/repositories/do_login_repository.dart';
import 'package:clean_arch_expert/features/auth/domain/usecases/do_login.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DoLoginRepositoryMock extends Mock implements DoLoginRepository {}

void main() {
  DoLoginRepository _doLoginRepository = DoLoginRepositoryMock();

  DoLogin _doLogin = DoLogin(_doLoginRepository);

  test("Deve realizar o login", () async {
    when(() => _doLoginRepository.doLogin(
        email: "email@teste.com",
        password: "123123")).thenAnswer((_) async => Right(tUser));

    var result = await _doLogin(
      DoLoginParams(email: "email@teste.com", password: "123123"),
    );

    expect(result, isA<Right>());
    expect(result, Right(tUser));
    verify(() => _doLoginRepository.doLogin(
        email: "email@teste.com", password: "123123")).called(1);
    verifyNoMoreInteractions(_doLoginRepository);
  });

  test("Deve realizar o login", () async {
    when(() => _doLoginRepository.doLogin(
        email: "email@teste.com",
        password: "123123")).thenAnswer((_) async => Right(tUser));

    var result = await _doLogin(
      DoLoginParams(email: "email@teste.com", password: "123123"),
    );

    expect(result, isA<Right>());
    expect(result, Right(tUser));
    verify(() => _doLoginRepository.doLogin(
        email: "email@teste.com", password: "123123")).called(1);
    verifyNoMoreInteractions(_doLoginRepository);
  });
}

var tUser = User(
  name: "Nome user",
  email: "email@teste.com",
  bornDate: DateTime.now(),
  pictureUrl: "urlUser",
);
