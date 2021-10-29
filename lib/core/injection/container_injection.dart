import 'package:clean_arch_expert/features/auth/data/datasources/do_login_datasource.dart';
import 'package:clean_arch_expert/features/auth/data/datasources/do_login_datasource_api.dart';
import 'package:clean_arch_expert/features/auth/data/repositories/do_login_repository_impl.dart';
import 'package:clean_arch_expert/features/auth/domain/repositories/do_login_repository.dart';
import 'package:clean_arch_expert/features/auth/domain/usecases/do_login.dart';
import 'package:clean_arch_expert/features/auth/presenter/controllers/login_controller.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final i = GetIt.instance;

class ContainerInjection {
  static void setup() {
    i.registerLazySingleton<Dio>(() => Dio());
    i.registerLazySingleton<DoLoginDatasource>(
        () => DoLoginDatasourceApi(i.get()));
    i.registerLazySingleton<DoLoginRepository>(
        () => DoLoginRepositoryImpl(i.get()));
    i.registerLazySingleton<DoLogin>(() => DoLogin(i.get()));
    i.registerFactory<LoginController>(() => LoginController(i.get()));
  }
}
