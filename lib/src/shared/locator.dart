import 'package:get_it/get_it.dart';
import 'package:smart_cite/src/shared/services/secure_storage.dart';
import '../core/routing/app_router.dart';
import 'package:dio/dio.dart';

final GetIt locator = GetIt.instance
  ..registerLazySingleton(() => AppRouter())
  ..registerLazySingleton(() => Dio())
  ..registerLazySingleton(() => SecureStorage())
;