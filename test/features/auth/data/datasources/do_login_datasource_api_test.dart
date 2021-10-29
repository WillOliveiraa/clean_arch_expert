import 'package:clean_arch_expert/core/usecases/error/failure.dart';
import 'package:clean_arch_expert/features/auth/data/datasources/do_login_datasource_api.dart';
import 'package:clean_arch_expert/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  var _dio = DioMock();
  var _datasource = DoLoginDatasourceApi(_dio);

  test('Should do login on api', () async {
    when(() => _dio.post(any(),
            data: {"email": "email@teste.com", "password": "123123"}))
        .thenAnswer((_) => Future.value(Response(
            requestOptions: RequestOptions(path: ""), data: tkUserApi)));

    UserModel user =
        await _datasource.doLogin(email: "email@teste.com", password: "123123");

    expect(user.toMap(), tkUserApi);
    verify(() => _dio.post(any(),
        data: {"email": "email@teste.com", "password": "123123"})).called(1);
    verifyNoMoreInteractions(_dio);
  });

  test('Should get error when try do login with api', () async {
    when(() => _dio.post(any(),
            data: {"email": "email@teste.com", "password": "123123"}))
        .thenThrow(ServerFailure());

    expect(
        () async => await _datasource.doLogin(
            email: "email@teste.com", password: "123123"),
        throwsA(isA<ServerFailure>()));
    verify(() => _dio.post(any(),
        data: {"email": "email@teste.com", "password": "123123"})).called(1);
    verifyNoMoreInteractions(_dio);
  });
}

var tkUserApi = {
  "name": "Will Oliveira",
  "bornDate": DateTime(2021, 10, 28).toIso8601String(),
  "pictureUrl": "urlUser",
  "email": "email@teste.com",
};
