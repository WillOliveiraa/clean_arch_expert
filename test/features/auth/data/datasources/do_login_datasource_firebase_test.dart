import 'package:clean_arch_expert/features/auth/data/datasources/do_login_datasource_firebase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var _datasource = DoLoginDatasourceFirebase();

  test('Should get error when try do login with firebase', () async {
    expect(
        () async => await _datasource.doLogin(
            email: "email@teste.com", password: "123123"),
        throwsA(isA<UnimplementedError>()));
  });
}
